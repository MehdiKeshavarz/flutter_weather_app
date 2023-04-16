import 'package:flutter_weather_app/core/resources/data_state.dart';
import 'package:flutter_weather_app/core/use_case/use_case.dart';
import 'package:flutter_weather_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_weather_app/features/feature_weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUseCase extends UseCase<DataState<CurrentCityEntity>,String>{
  WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);

  @override
  Future<DataState<CurrentCityEntity>> call(String params) {
    return weatherRepository.fetchCurrentWeatherData(params);
  }

}