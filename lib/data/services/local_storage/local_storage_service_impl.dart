import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/result/result.dart';
import 'local_storage_service.dart';

final class LocalStorageServiceImpl implements LocalStorageService {
  final FlutterSecureStorage secureStorage;

  const LocalStorageServiceImpl({required this.secureStorage});

  @override
  Future<Result<Exception, String>> getIdToken() async {
    final idToken = await secureStorage.read(key: 'idToken');

    return idToken != null
        ? Success(idToken)
        : Failure(Exception('No idToken found'));
  }

  @override
  Future<Result<void, Unit>> removeIdToken() async {
    await secureStorage.delete(key: 'idToken');

    return const Success(unit);
  }

  @override
  Future<Result<void, Unit>> saveIdToken(String idToken) async {
    await secureStorage.write(key: 'idToken', value: idToken);

    return const Success(unit);
  }
}
