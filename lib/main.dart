import 'package:final_test_app/core/network/dio_settings.dart';
import 'package:final_test_app/domain/repositories/get_weather_impl.dart';
import 'package:final_test_app/domain/usecase/get_weather_usecase.dart';
import 'package:final_test_app/presentation/bloc/get_weather_bloc.dart';
import 'package:final_test_app/presentation/screens/home.dart';
import 'package:final_test_app/provider/calc_provider.dart';
import 'package:final_test_app/provider/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DioSettings()),
        RepositoryProvider(
            create: (context) => GetWeatherUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio)),
        RepositoryProvider(
            create: (context) => GetWeatherImpl(
                useCase: RepositoryProvider.of<GetWeatherUseCase>(context)))
      ],
      child: BlocProvider(
        create: (context) => GetWeatherBloc(
            repository: RepositoryProvider.of<GetWeatherImpl>(context)),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ThemeProvider()),
            ChangeNotifierProvider(create: (context) => CalcProvider())
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        ),
      ),
    );
  }
}
