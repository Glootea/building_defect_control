import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

Dio createDio([BaseOptions? options]) =>
    Dio(options)
      ..httpClientAdapter = BrowserHttpClientAdapter(withCredentials: true);
