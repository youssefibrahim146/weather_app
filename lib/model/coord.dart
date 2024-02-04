class Coord {
  final double lon, lat;

  Coord({required this.lon,required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json["lon"] as double,
      lat: json["lat"] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "lon": lon,
      "lat": lat,
    };
  }
//
}
