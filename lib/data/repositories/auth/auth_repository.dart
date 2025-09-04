import '../../../core/result/result.dart';

abstract interface class AuthRepository {
  Future<Result<Exception, Unit>> signIn();
  Future<Result<Exception, Unit>> signOut();
  Future<Result<Exception, bool>> isLogged();
}
