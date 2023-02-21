import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

@JsonSerializable()
class Weather {
  String city = "";
  String conditions;
  double pressure;
  double temp;
  double humidity;

  Weather(
      {required this.conditions,
      required this.temp,
      required this.humidity,
      required this.pressure});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
