import 'package:weather_app_mvvm/weather/data/datasource/remote_datasource.dart';
import 'package:weather_app_mvvm/weather/domain/entities/weather.dart';

import '../../domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDatasource baseRemoteDatasource;

  WeatherRepository(this.baseRemoteDatasource);
  @override
  Future<WeatherEntity> getWeatherByCityName({required String cityName}) {
    return baseRemoteDatasource.getWeatherByCityName(cityName: cityName);
  }
  
}