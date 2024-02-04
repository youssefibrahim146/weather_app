class Wind {
  final double speed;
  final int deg;

  Wind({required this.speed, required this.deg});

  Map<String, dynamic> toJson() {
    return {
      "speed": speed,
      "deg": deg,
    };
  }

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json["speed"] as double,
      deg: json["deg"] as int,
    );
  }
}
