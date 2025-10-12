import 'package:control/data/data_provider.dart';
import 'package:control/data/idata_provider.dart';
import 'package:control/data/network.dart';
import 'package:control/data/testing_data_provider.dart';
import 'package:control/domain/user.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'di.g.dart';

@riverpod
IDataProvider dataProvider(Ref ref) {
  final dio = ref.watch(getDioProvider);
  return DataProvider(dio);
}

@Riverpod(keepAlive: true)
IDataProvider testingDataProvider(Ref ref) {
  return TestingDataProvider();
}

@riverpod
IAuthService authService(Ref ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  final userDataProvider = ref.watch(userDataProviderProvider);
  return AuthService(
    secureStorage: secureStorage,
    userDataProvider: userDataProvider,
  );
}

@riverpod
IAuthService testingAuthService(Ref ref) {
  return const TestingAuthService();
}

@riverpod
Dio getDio(Ref ref) {
  return setupDio();
}

@riverpod
IUserDataProvider userDataProvider(Ref ref) {
  final dio = ref.watch(getDioProvider);
  return UserDataProvider(dio);
}

@riverpod
IUserDataProvider testingUserDataProvider(Ref ref) {
  return const TestingUserDataProvider();
}

@riverpod
Uuid uuid(Ref ref) => Uuid();

@riverpod
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage();
}
