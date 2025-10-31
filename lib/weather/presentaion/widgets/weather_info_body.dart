import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mvvm/weather/presentaion/controller/cubit/getweather_cubit/getweather_cubit.dart';

import '../../../main.dart';
import '../../domain/entities/weather.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherEntity? weatherEntity = BlocProvider.of<GetWeatherCubit>(
      context,
      listen: false,
    ).weatherEntity;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherEntity!.main),
            getThemeColor(weatherEntity.main)[700]!,
            getThemeColor(weatherEntity.main)[600]!,
            getThemeColor(weatherEntity.main)[500]!,
            getThemeColor(weatherEntity.main)[300]!,
            getThemeColor(weatherEntity.main)[200]!,
            getThemeColor(weatherEntity.main)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherEntity.cityName,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              "country : ${weatherEntity.country} ",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weatherEntity.main,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "MaxTemp :${weatherEntity.temp_max} ",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "MinTemp : ${weatherEntity.temp_min}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Column(
              children: [
                Text("pressure", style: const TextStyle(fontSize: 18)),
                Text(
                  "${weatherEntity.pressure}",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
