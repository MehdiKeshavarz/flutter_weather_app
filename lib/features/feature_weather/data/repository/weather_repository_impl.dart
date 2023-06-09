

import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/resources/data_state.dart';
import 'package:flutter_weather_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_weather_app/features/feature_weather/data/models/current_city_model.dart';
import 'package:flutter_weather_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_weather_app/features/feature_weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository{

  ApiProvider apiProvider;


  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName) async{
    // TODO: implement fetchCurrentWeatherData

    try{

      Response response =await apiProvider.callCurrentWeather(cityName);

      if(response.statusCode == 200){
        
        CurrentCityEntity currentCityEntity = CurrentCityModel.fromJson(response.data);
        return DataSuccess(currentCityEntity);
      }else{
        return const DataFailed('اطلاعاتی دریافت نشد!!!');
      }

    }catch(e){
          return const DataFailed('ارتباط برقرار نشد دوباره تلاش کنید!');
    }
  }
}