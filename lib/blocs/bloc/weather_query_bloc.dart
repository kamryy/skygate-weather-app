import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:weather_app/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/api_key.dart';
part 'weather_query_event.dart';
part 'weather_query_state.dart';

class WeatherQueryBloc extends Bloc<WeatherQueryEvent, WeatherQueryState> {
  WeatherQueryBloc() : super(WeatherQueryState()) {
    on<QueryWeather>(_onQueryWeather);
  }
  void _onQueryWeather(
      QueryWeather event, Emitter<WeatherQueryState> emit) async {
    emit(WeatherQueryLoading());
    final response = await http.get(Uri.parse(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/${event.city}/today?unitGroup=metric&include=current&key=$apiKey&contentType=json'));
    Weather weather =
        Weather.fromJson(jsonDecode(response.body)['currentConditions']);
    weather.city = event.city;
    emit(WeatherQueryLoaded(weather: weather));
  }
}
