class Clouds {
  final int all;

  Clouds({required this.all});

  Map<String, dynamic> toJson() {
    return {
      "all": all,
    };
  }

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json["all"] as int,
    );
  }
//
}
