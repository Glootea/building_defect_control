import 'package:control/data/data_provider.dart';
import 'package:control/data/idata_provider.dart';
import 'package:control/data/testing_data_provider.dart';
import 'package:control/domain/user.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'di.g.dart';

@riverpod
IDataProvider dataProvider(Ref ref) {
  final dio = ref.read(getDioProvider);
  return DataProvider(dio);
}

@Riverpod(keepAlive: true)
IDataProvider testingDataProvider(Ref ref) {
  return TestingDataProvider();
}

@riverpod
IAuthService authService(Ref ref) {
  final secureStorage = ref.read(secureStorageProvider);
  final dio = ref.read(getDioProvider);
  return AuthService(secureStorage: secureStorage, dio: dio);
}

@riverpod
IAuthService testingAuthService(Ref ref) {
  return const TestingAuthService();
}

@riverpod
Dio getDio(Ref ref) {
  final dio = Dio();
  return dio;
}

@riverpod
Uuid uuid(Ref ref) => Uuid();

@riverpod
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage();
}
