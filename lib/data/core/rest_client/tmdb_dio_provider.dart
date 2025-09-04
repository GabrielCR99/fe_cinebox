import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../config/env.dart';

part 'tmdb_dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio tmdbDio(Ref ref) =>
    Dio(
        BaseOptions(
          baseUrl: Env.tmdbApiKey,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          headers: {
            HttpHeaders.contentTypeHeader: ContentType.json.value,
            HttpHeaders.authorizationHeader: 'Bearer ${Env.tmdbApiKey}',
          },
        ),
      )
      ..interceptors.addAll([
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      ]);
