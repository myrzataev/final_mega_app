import 'package:final_test_app/presentation/bloc/get_weather_bloc.dart';
import 'package:final_test_app/provider/calc_provider.dart';
import 'package:final_test_app/provider/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ThemeProvider>().currentColor(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<GetWeatherBloc, GetWeatherState>(
              builder: (context, state) {
                if (state is GetWeatherLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetWeatherSuccess) {
                  return Column(
                    children: [
                      Text(state.model.name),
                      Text(state.model.main.temp.toString()),
                    ],
                  );
                } else if (state is GetWeatherError) {
                  return Text(state.errorText);
                }
                return const SizedBox();
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${context.watch<CalcProvider>().number.toString()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: InkWell(
                        onTap: () {
                          BlocProvider.of<GetWeatherBloc>(context)
                              .add(GetWeatherEventEvent());
                        },
                        child: const Icon(
                          Icons.cloud,
                          size: 40,
                        )),
                  ),
                  const Spacer(),
                  context.watch<CalcProvider>().number == 10
                      ? SizedBox()
                      : CircleAvatar(
                          radius: 50,
                          child: InkWell(
                              onTap: () {
                                context.read<CalcProvider>().increment();
                              },
                              child: const Icon(
                                Icons.add,
                                size: 40,
                              )),
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: InkWell(
                        onTap: () {
                          context.read<ThemeProvider>().changeTheme();
                        },
                        child: const Icon(
                          Icons.color_lens,
                          size: 40,
                        )),
                  ),
                  const Spacer(),
                  context.watch<CalcProvider>().number == 0
                      ? SizedBox()
                      : CircleAvatar(
                          radius: 50,
                          child: InkWell(
                              onTap: () {
                                context.read<CalcProvider>().decrement();
                              },
                              child: const Icon(
                                Icons.minimize,
                                size: 40,
                              )),
                        )
                ],
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
