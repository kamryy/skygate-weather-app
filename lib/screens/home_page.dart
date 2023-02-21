import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/bloc/weather_query_bloc.dart';
import 'package:weather_app/widgets/search_bar.dart';
import 'package:weather_app/widgets/weather_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Weather App"))),
      body: BlocBuilder<WeatherQueryBloc, WeatherQueryState>(
        builder: (context, state) {
          if (state is WeatherQueryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherQueryLoaded) {
            print(state.weather!.conditions);
            return Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SearchBar(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    WeatherWidget(
                      weather: state.weather!,
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: SearchBar(),
            );
          }
        },
      ),
    );
  }
}
