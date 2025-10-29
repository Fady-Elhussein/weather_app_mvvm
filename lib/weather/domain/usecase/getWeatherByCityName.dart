import '../entities/weather.dart';
import '../repository/weather_repository.dart';

class GetWeatherByCityName {
  final WeatherRepository repository;

  GetWeatherByCityName(this.repository);

  Future<WeatherEntity> call({required String cityName}) async{
    return  await repository.getWeatherByCityName(cityName: cityName);
  }
}