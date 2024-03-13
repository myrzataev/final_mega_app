import 'package:final_test_app/data/models/weather_model.dart';

abstract class GetWeatherRepo{
  Future <WeatherModel> getWeather();
}