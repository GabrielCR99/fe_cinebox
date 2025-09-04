import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/rest_client/backend_rest_client_provider.dart';
import 'auth/auth_service.dart';
import 'google_sign_in/google_sign_in_service.dart';
import 'google_sign_in/google_sign_in_service_impl.dart';
import 'local_storage/local_storage_service.dart';
import 'local_storage/local_storage_service_impl.dart';

part 'services_provider.g.dart';

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) =>
    const LocalStorageServiceImpl(secureStorage: FlutterSecureStorage());

@riverpod
GoogleSignInService googleSignInService(Ref ref) => GoogleSignInServiceImpl();

@riverpod
AuthService authService(Ref ref) =>
    AuthService(ref.read(backendRestClientProvider));
