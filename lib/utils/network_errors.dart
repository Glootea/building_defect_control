import 'package:control/utils/context_extentions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

extension ControlExceptionFormat on DioException {
  String format(BuildContext context) {
    if (response?.data['message'] != null &&
        (response?.data['message']?.isNotEmpty ?? false)) {
      return response!.data['message']!;
    }
    final translate = context.translate;
    switch (response?.statusCode) {
      case 400:
        return translate.badRequest;
      case 401:
        return translate.unauthorized;
      case 403:
        return translate.forbidden;
      case 404:
        return translate.notFound;
      case 500:
        return translate.internalServerError;
      default:
        return translate.unknownError;
    }
  }
}
