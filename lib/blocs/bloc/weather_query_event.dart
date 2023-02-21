part of 'weather_query_bloc.dart';


abstract class WeatherQueryEvent {
  const WeatherQueryEvent();

  @override
  List<Object> get props => [];
}

class QueryWeather extends WeatherQueryEvent{
  String city;
  QueryWeather({required this.city});

  @override
  List<Object> get props => [city];
}