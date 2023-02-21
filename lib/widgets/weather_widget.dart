import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WeatherWidget extends StatelessWidget {
  Weather weather;
  WeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weather.city[0].toUpperCase() + weather.city.substring(1),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 60,
                fontFamily: "Courier New",
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("${weather.temp.round()}°C",
              style: const TextStyle(
                  fontSize: 45,
                  fontFamily: "Courier New",
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.water_damage_outlined,
                    size: 30,
                  ),
                  Text("${weather.humidity.round()}%",
                      style: const TextStyle(
                          fontSize: 25,
                          fontFamily: "Courier New",
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                width: 60,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.speed_outlined,
                    size: 30,
                  ),
                  Text("${weather.pressure.round()}hpa",
                      style: const TextStyle(
                          fontSize: 25,
                          fontFamily: "Courier New",
                          fontWeight: FontWeight.bold)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
