import 'package:weather_app_mvvm/weather/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.id,
    required super.cityName,
    required super.description,
    required super.main,
    required super.pressure,
    required super.temp_min,
    required super.temp_max, required super.country,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      cityName: json['name'],
      description: json['weather'][0]['description'],
      main: json['weather'][0]['main'],
      pressure: json['main']['pressure'],
      temp_min: json['main']["temp_min"],
      temp_max: json['main']["temp_max"], country: json['sys']["country"],
    );
  }
}
