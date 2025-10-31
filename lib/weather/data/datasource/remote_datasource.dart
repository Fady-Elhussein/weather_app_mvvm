import 'package:dio/dio.dart';
import '../../../core/utils/const.dart';
import '../model/weather_model.dart';

abstract class BaseRemoteDatasource {
  Future<WeatherModel> getWeatherByCityName({required String cityName});
}

class RemoteDatasource extends BaseRemoteDatasource {
  @override
  Future<WeatherModel> getWeatherByCityName({required String cityName}) async {
    Response response = await Dio().get(
      '${AppConstants.baseUrl}/weather?q=$cityName&appid=${AppConstants.apiKey}',
    );
    try {
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Failed to load weather data : $e');
    }
  }
}
