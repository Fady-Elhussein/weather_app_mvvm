import '../entities/weather.dart';
import '../repository/base_weather_repository.dart';

class GetWeatherByCityName {
  final BaseWeatherRepository repository;

  GetWeatherByCityName(this.repository);

  Future<WeatherEntity> call({required String cityName}) async {
    return await repository.getWeatherByCityName(cityName: cityName);
  }
}