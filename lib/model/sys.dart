class Sys {
  final int type, id;
  final String country;
  final int sunrise, sunset;

  Sys(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset
      });

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "id": id,
      "country": country,
      "sunrise": sunrise,
      "sunset": sunset,
    };
  }

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json["type"],
      id: json["id"],
      country: json["country"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
    );
  }
}
