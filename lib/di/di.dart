import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:marshather_app/data/datasources/remote/geocoding_remote_datasources.dart';
import 'package:marshather_app/presentation/screens/screens.dart';
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

    sl
      ..registerSingleton<DioClient>(DioClient(isUnitTest: true))
      ..registerSingleton<DioGeocodingClient>(
        DioGeocodingClient(isUnitTest: true),
      );

    dataSources();
    repositories();
    //services();
    useCase();
    cubit();
  } else {
    sl
      ..registerSingleton<DioClient>(DioClient())
      ..registerSingleton<DioGeocodingClient>(DioGeocodingClient())
      ..registerSingleton<NoTokenDioClient>(NoTokenDioClient())
      ..registerSingleton<NoTokenDioGeocodingClient>(
        NoTokenDioGeocodingClient(),
      );

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
    )
    ..registerLazySingleton<GeocodingRemoteDatasource>(
      () => GeocodingRemoteDatasourceImpl(
        sl(),
        sl(),
      ),
    );
}

/// Register repositories
void repositories() {
  sl
    ..registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(sl()))
    ..registerLazySingleton<GeocodingRepository>(
        () => GeocodingRepositoryImpl(sl()));
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
  sl
    ..registerLazySingleton(() => GetWeatherForecastDaily(sl()))
    ..registerLazySingleton(() => GetGeocodingPlaceLocations(sl()));
}

void cubit() {
  sl
    ..registerLazySingleton(
      () => HomeDayHoursCubit(
        getWeatherDayHourly: sl(),
      ),
    )
    ..registerLazySingleton(
      () => SearchGeocodingLocationsCubit(
        getGeocodingLocationsByCityName: sl(),
        homeDayHoursCubit: sl(),
      ),
    );
}
