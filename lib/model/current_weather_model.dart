import 'package:weather_app/model/clouds.dart';
import 'package:weather_app/model/coord.dart';
import 'package:weather_app/model/main_weather.dart';
import 'package:weather_app/model/sys.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/wind.dart';

class CurrentWeatherModel {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final MainWeather mainWeather;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  CurrentWeatherModel(
      {required this.coord,
      required this.weather,
      required this.base,
      required this.mainWeather,
      required this.visibility,
      required this.wind,
      required this.clouds,
      required this.dt,
      required this.sys,
      required this.timezone,
      required this.id,
      required this.name,
      required this.cod});

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      coord: Coord.fromJson(json["coord"]),
      weather:
          (json['weather'] as List).map((w) => Weather.fromJson(w)).toList(),
      base: json["base"],
      mainWeather: MainWeather.fromJson(json["main"]),
      visibility: json["visibility"],
      wind: Wind.fromJson(json["wind"]),
      clouds: Clouds.fromJson(json["clouds"]),
      dt: json["dt"],
      sys: Sys.fromJson(json["sys"]),
      timezone: json["timezone"] as int,
      id: json["id"],
      name: json["name"],
      cod: json["cod"] as int,
    );
  }
//
}
