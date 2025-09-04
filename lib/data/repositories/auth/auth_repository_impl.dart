import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/result/result.dart';
import '../../exceptions/data_exception.dart';
import '../../services/auth/auth_service.dart';
import '../../services/google_sign_in/google_sign_in_service.dart';
import '../../services/local_storage/local_storage_service.dart';
import 'auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService localStorageService;
  final GoogleSignInService googleSignInService;
  final AuthService authService;

  const AuthRepositoryImpl({
    required this.localStorageService,
    required this.googleSignInService,
    required this.authService,
  });

  @override
  Future<Result<Exception, bool>> isLogged() async {
    final resultToken = await localStorageService.getIdToken();

    return resultToken.when(
      success: (_) => const Success(true),
      error: (_) => const Success(false),
    );
  }

  @override
  Future<Result<Exception, Unit>> signIn() async {
    final result = await googleSignInService.signIn();

    return result.when(
      success: (value) async {
        await localStorageService.saveIdToken(value);

        try {
          await authService.auth();

          return const Success(unit);
        } on DioException catch (e, s) {
          log(
            'Error on Auth with backend',
            name: 'AuthRepositoryImpl',
            error: e,
            stackTrace: s,
          );

          return const Failure(
            DataException('Erro ao realizar login no backend'),
          );
        }
      },
      error: (value) {
        log(
          'Error on Google Sign In',
          name: 'AuthRepositoryImpl',
          error: value,
        );

        return const Failure(DataException('Error on Google Sign In'));
      },
    );
  }

  @override
  Future<Result<Exception, Unit>> signOut() async {
    final result = await googleSignInService.signOut();

    switch (result) {
      case Success():
        final result = await localStorageService.removeIdToken();

        switch (result) {
          case Success():
            return const Success(unit);
          case Failure(:final value):
            log(
              'Error on removing Id Token',
              name: 'AuthRepositoryImpl',
              error: value,
            );
            return Failure(value);
          case _:
            return Failure(Exception('Unknown Error on removing Id Token'));
        }

      case Failure(:final value):
        log(
          'Error on Google Sign Out',
          name: 'AuthRepositoryImpl',
          error: value,
        );

        return const Failure(DataException('Error on Google Sign Out'));
    }
  }
}
