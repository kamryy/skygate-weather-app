part of 'weather_query_bloc.dart';

class WeatherQueryState {}

class WeatherQueryLoaded extends WeatherQueryState {
  final Weather? weather;
  WeatherQueryLoaded({this.weather});
}

class WeatherQueryLoading extends WeatherQueryState {}
