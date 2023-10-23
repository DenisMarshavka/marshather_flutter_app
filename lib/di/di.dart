import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:marshather_app/data/data.dart';
import 'package:marshather_app/domain/domain.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({bool isUnitTest = false}) async {
  log('Initiating Service Locator');

  /// For unit testing only
  if (isUnitTest) {
    WidgetsFlutterBinding.ensureInitialized();
    await sl.reset();

    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    await SharedPreferences.getInstance().then(initPrefManager);

    sl.registerSingleton<DioClient>(DioClient(isUnitTest: true));
    dataSources();
    repositories();
    //services();
    useCase();
    cubit();
  } else {
    sl.registerSingleton<DioClient>(DioClient());
    //..registerSingleton<NotificationsService>(NotificationsService())
    dataSources();
    repositories();
    //services();
    useCase();
    cubit();
  }
}

// Register prefManager
void initPrefManager(SharedPreferences initPrefManager) {
  log('---- initPrefManager');

  sl.registerLazySingleton<PrefManager>(() => PrefManager(initPrefManager));
}

/// Register dataSources
void dataSources() {
  sl
    ..registerLazySingleton<WeatherRemoteDatasource>(
      () => WeatherRemoteDatasourceImpl(
        sl(),
        sl(),
      ),
    );
}

/// Register repositories
void repositories() {
  sl
    ..registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(sl()));
}

/// Register services
/*void services() {
  sl
    ..registerLazySingleton<PushNotificationsService>(
      PushNotificationsService.new,
    );
}*/

void useCase() {
  /// Auth
  sl..registerLazySingleton(() => GetWeatherForecastDaily(sl()));
}

void cubit() {
  /*sl
    /*..registerLazySingleton(
      UserSettingsCubit.new,
    )*/
    ..registerLazySingleton(
      () => TwoFactorAuthCubit(
        postSetTwoFactorAuth: sl(),
        postTwoFactorAuthConfirmCode: sl(),
        postTwoFactorAuthVerifyPhoneConfirm: sl(),
        postTwoFactorAuthVerifyPhoneSend: sl(),
        userSettingsCubit: sl(),
        loginBloc: sl(),
        postLogin: sl(),
      ),
    );*/
}
