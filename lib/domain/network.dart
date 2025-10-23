import 'dart:developer';

import 'package:control/di/network/network.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'network.g.dart';

@riverpod
class DioClient extends _$DioClient {
  final baseUrl = const String.fromEnvironment('BACKEND_URL', defaultValue: '');
  final useNetworkLogging =
      const String.fromEnvironment(
        'USE_NETWORK_LOGGING',
        defaultValue: 'false',
      ) ==
      'true';

  @override
  Dio build() {
    if (baseUrl.isEmpty) {
      throw Exception('Env BACKEND_URL is not setup');
    }

    final options = BaseOptions(
      baseUrl: baseUrl,
      contentType: "application/json",
    );

    final dio = createDio(options);

    if (useNetworkLogging) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (o) => log(o.toString()),
        ),
      );
    }

    return dio;
  }
}
