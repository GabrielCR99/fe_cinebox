import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/services_provider.dart';
import 'auth/auth_repository.dart';
import 'auth/auth_repository_impl.dart';

part 'repositories_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl(
  localStorageService: ref.read(localStorageServiceProvider),
  googleSignInService: ref.read(googleSignInServiceProvider),
  authService: ref.read(authServiceProvider),
);
