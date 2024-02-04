class MainWeather {
  final double temp, feels_like, temp_min, temp_max;
  final int humidity, pressure;

  MainWeather(
      {required this.temp,
        required this.feels_like,
        required this.temp_min,
        required this.temp_max,
        required this.pressure,
        required this.humidity});

  Map<String, dynamic> toJson() {
    return {
      "temp": temp,
      "feels_like": feels_like,
      "temp_min": temp_min,
      "temp_max": temp_max,
      "pressure": pressure,
      "humidity": humidity,
    };
  }

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: json["temp"] as double,
      feels_like:  json["feels_like"] as double,
      temp_min: json["temp_min"] as double,
      temp_max: json["temp_max"] as double,
      pressure: json["pressure"] as int,
      humidity: json["humidity"] as int,
    );
  }
}
