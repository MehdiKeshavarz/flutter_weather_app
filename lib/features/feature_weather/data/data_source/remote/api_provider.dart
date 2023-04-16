

import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/utils/constants.dart';

class ApiProvider{
  final Dio _dio = Dio();

  var apiKey = Constants.apiKey;

  /// current weather api call
 Future<dynamic> callCurrentWeather(String cityName) async{
    var response = await _dio.get(
      '${Constants.baseUrl}/data/2.5/weather',
      queryParameters: {
        'q': cityName,
        'appid': apiKey,
        'units':'metric',
      },
    );

    print(response);

    return response;
  }
}