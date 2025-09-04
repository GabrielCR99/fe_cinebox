import '../../../core/result/result.dart';

abstract interface class GoogleSignInService {
  Future<Result<Exception, String>> signIn();
  Future<Result<Exception, Unit>> signOut();
  Future<Result<void, String>> isSignedIn();
}
