import '../../../core/result/result.dart';

abstract interface class LocalStorageService {
  Future<Result<void, Unit>> saveIdToken(String idToken);
  Future<Result<Exception, String>> getIdToken();
  Future<Result<void, Unit>> removeIdToken();
}
