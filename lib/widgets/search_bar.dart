import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/bloc/weather_query_bloc.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: TextField(
            controller: controller,
            decoration:
                const InputDecoration(border: OutlineInputBorder(), hintText: "City"),
          )),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              context.read<WeatherQueryBloc>()..add(QueryWeather(city: controller.text));
            },
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(18)),
                child: const Icon(
                  CupertinoIcons.search,
                  size: 26,
                )),
          )
        ],
      ),
    );
  }
}
