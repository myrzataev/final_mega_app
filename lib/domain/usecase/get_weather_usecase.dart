import 'package:dio/dio.dart';
import 'package:final_test_app/data/models/weather_model.dart';

class GetWeatherUseCase {
  Dio dio;
  GetWeatherUseCase({required this.dio});
  Future<WeatherModel> getWeather() async {
    final Response response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?',
        queryParameters: {
          "lat": 42.882004,
          "lon": 74.582748,
          "appid": "9096b8fa3695ac9f14f966b36662a168",
          "units": "metric"
        });
    print(response.data);
    return WeatherModel.fromJson(response.data);
  }
}
