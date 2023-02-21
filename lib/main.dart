import 'package:flutter/material.dart';
import 'package:weather_app/blocs/bloc/weather_query_bloc.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main(List<String> args) {
  BlocOverrides.runZoned(() => runApp(const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
          create: (context) => WeatherQueryBloc(), child: const HomePage()),
    );
  }
}
