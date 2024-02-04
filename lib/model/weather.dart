class Weather{
final int id;
final String main,description,icon;

Weather({required this.id,required this.main,required this.description,required this.icon});

Map<String, dynamic> toJson() {
    return {
      "id": id,
      "main": main,
      "description": description,
      "icon": icon,
    };
  }

factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json["id"] as int,
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
    );
  }

}