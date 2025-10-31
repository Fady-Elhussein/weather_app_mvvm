class WeatherEntity {
  final int id;
  final int pressure;
  final String cityName;
  final String description;
  final String main;
  final String country;
  final double temp_min;
  final double temp_max;

  WeatherEntity({
    required this.id,
    required this.country,
    required this.temp_min,
    required this.temp_max,
    required this.cityName,
    required this.description,
    required this.main,
    required this.pressure,
  });
}
