part of 'get_weather_bloc.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}
final class GetWeatherLoading extends GetWeatherState {}
final class GetWeatherSuccess extends GetWeatherState {
  WeatherModel model;
  GetWeatherSuccess({required this.model});
}
final class GetWeatherError extends GetWeatherState {
  final String errorText;
  GetWeatherError({required this.errorText});
}
