import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

extension ControlExceptionFormat on DioException {
  String format(BuildContext context) {
    if (response?.data['message'] != null &&
        (response?.data['message']?.isNotEmpty ?? false)) {
      return response!.data['message']!;
    } // TODO: should be status message?

    switch (response?.statusCode) {
      // TODO: localize
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Unknown error';
    }
  }
}
