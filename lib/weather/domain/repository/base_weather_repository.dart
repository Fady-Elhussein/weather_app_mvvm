import 'package:weather_app_mvvm/weather/domain/entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<WeatherEntity> getWeatherByCityName({required String cityName});
  }
