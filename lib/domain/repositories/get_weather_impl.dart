import 'package:final_test_app/data/models/weather_model.dart';
import 'package:final_test_app/data/repository/get_weather.dart';
import 'package:final_test_app/domain/usecase/get_weather_usecase.dart';

class GetWeatherImpl implements GetWeatherRepo{
  GetWeatherUseCase useCase;
  GetWeatherImpl({required this.useCase});
  @override
  Future<WeatherModel> getWeather()async {
   return useCase.getWeather();
  }
}