import 'package:bloc/bloc.dart';
import 'package:final_test_app/data/models/weather_model.dart';
import 'package:final_test_app/domain/repositories/get_weather_impl.dart';
import 'package:meta/meta.dart';

part 'get_weather_event.dart';
part 'get_weather_state.dart';

class GetWeatherBloc extends Bloc<GetWeatherEvent, GetWeatherState> {
  GetWeatherImpl repository;
  GetWeatherBloc({required this.repository}) : super(GetWeatherInitial()) {
    on<GetWeatherEvent>((event, emit) async {
      emit(GetWeatherLoading());
      try {
        final result = await repository.getWeather();
        emit(GetWeatherSuccess(model: result));
      } catch (e) {
        emit(GetWeatherError(errorText: e.toString()));
      }
    });
  }
}
