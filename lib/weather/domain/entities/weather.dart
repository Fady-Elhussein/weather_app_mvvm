class WeatherEntity {
  final int id;
  final int pressure;
  final String cityName;
  final String description;
  final String main;

  WeatherEntity( {
    required this.id,
    required this.cityName,
    required this.description,
    required this.main,
    required this.pressure,
  });
}



