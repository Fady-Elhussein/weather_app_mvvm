import 'package:weather_app_mvvm/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeatherByCityName({required String cityName});
  }
