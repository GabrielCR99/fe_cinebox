import 'dart:io';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/env.dart';
import '../../../core/result/result.dart';
import '../../services/services_provider.dart';

part 'backend_rest_client_provider.g.dart';

final class BackendAuthInterceptor extends Interceptor {
  final Ref ref;

  const BackendAuthInterceptor({required this.ref});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final localStorage = ref.read(localStorageServiceProvider);
    final idToken = await localStorage.getIdToken();
    if (idToken case Success(:final value)) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $value';
    }

    return handler.next(options);
  }
}

@Riverpod(keepAlive: true)
Dio backendRestClient(Ref ref) =>
    Dio(
        BaseOptions(
          baseUrl: Env.backendBaseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            HttpHeaders.contentTypeHeader: ContentType.json.value,
          },
        ),
      )
      ..interceptors.addAll([
        BackendAuthInterceptor(ref: ref),
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      ]);
