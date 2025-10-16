import 'dart:developer';

import 'package:control/di/di.dart';
import 'package:control/domain/user.dart';
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

    final dio = Dio(options);

    if (useNetworkLogging) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (o) => log(o.toString()),
        ),
      );
    }

    ref.listen(userProvider, (prev, cur) async {
      if (prev?.value == null && cur.value != null) {
        final token = await ref.read(userCacheProvider).getToken();
        dio.interceptors.add(_TokenInterceptor(token));
      } else if (prev?.value != null && cur.value == null) {
        dio.interceptors.removeWhere((element) => element is _TokenInterceptor);
      }
    });

    return dio;
  }
}

class _TokenInterceptor extends Interceptor {
  final String? token;

  _TokenInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
