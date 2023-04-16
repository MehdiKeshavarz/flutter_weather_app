

import 'package:flutter_weather_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_weather_app/features/feature_weather/data/repository/weather_repository_impl.dart';
import 'package:flutter_weather_app/features/feature_weather/domain/repository/weather_repository.dart';
import 'package:flutter_weather_app/features/feature_weather/domain/use_case/get_current_weather_usecase.dart';
import 'package:flutter_weather_app/features/feature_weather/presention/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;


setup(){
  /// api
  locator.registerSingleton<ApiProvider>(ApiProvider());

  ///repository
  locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));

  ///use case
  locator.registerSingleton<GetCurrentWeatherUseCase>(GetCurrentWeatherUseCase(locator()));

  ///HomeBloc
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
}