import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mvvm/bloc_observer.dart';
import 'weather/presentaion/controller/cubit/getweather_cubit/getweather_cubit.dart';
import 'weather/presentaion/screens/home_view.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly Cloudy':
      return Colors.blueGrey;
    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
      return Colors.grey;
    case 'Patchy Rain Possible':
    case 'Patchy Snow Possible':
    case 'Patchy Sleet Possible':
    case 'Patchy Freezing Drizzle Possible':
      return Colors.blue;
    case 'Thundery Outbreaks Possible':
      return Colors.red;
    case 'Blowing Snow':
    case 'Blizzard':
    case 'Fog':
    case 'Freezing Fog':
    case 'Heavy Snow':
    case 'Ice Pellets':
    case 'Torrential Rain Shower':
      return Colors.blue;
    case 'Light Snow':
    case 'Moderate Snow':
    case 'Patchy Heavy Snow':
      return Colors.blue;
    case 'Light Rain':
    case 'Moderate Rain':
    case 'Heavy Rain':
      return Colors.blue;
    case 'Light Freezing Rain':
    case 'Light Sleet':
    case 'Moderate or Heavy Sleet':
      return Colors.blue;
    case 'Light Snow Showers':
    case 'Moderate or Heavy Snow Showers':
      return Colors.blue;
    case 'Patchy Light Rain with Thunder':
    case 'Moderate or Heavy Rain with Thunder':
    case 'Patchy Light Snow with Thunder':
    case 'Moderate or Heavy Snow with Thunder':
      return Colors.red;
    default:
      return Colors.blue;
  }
}