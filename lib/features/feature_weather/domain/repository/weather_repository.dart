
import 'package:flutter_weather_app/core/resources/data_state.dart';
import 'package:flutter_weather_app/features/feature_weather/domain/entities/current_city_entity.dart';

abstract class WeatherRepository{

  Future<DataState<CurrentCityEntity>>fetchCurrentWeatherData(String cityName);
}