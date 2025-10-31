import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mvvm/weather/data/datasource/remote_datasource.dart';
import 'package:weather_app_mvvm/weather/data/repository/weather_repository.dart';
import 'package:weather_app_mvvm/weather/domain/entities/weather.dart';
import 'package:weather_app_mvvm/weather/domain/repository/base_weather_repository.dart';
import 'package:weather_app_mvvm/weather/domain/usecase/getWeatherByCityName.dart';

import '../getweather_states/getweather_states.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(InitialWeatherState());
  WeatherEntity? weatherEntity;
  BaseRemoteDatasource baseRemoteDatasource = RemoteDatasource();

  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoadingState());
      BaseWeatherRepository baseWeatherRepository = WeatherRepository(
        baseRemoteDatasource,
      );

      weatherEntity = await GetWeatherByCityName(
        baseWeatherRepository,
      ).call(cityName: cityName);
      print(weatherEntity!.cityName);

      emit(WeatherSuccessState());
    } catch (e) {
      print(e);
      emit(WeatherErrorState());

      throw Exception(e);
    }
  }
}
