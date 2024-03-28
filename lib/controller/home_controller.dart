import 'package:get/get.dart';
import 'package:weather_app/api/api_repo.dart';
import 'package:weather_app/model/current_weather_model.dart';

class HomeController extends GetxController {
  String city = '';
  CurrentWeatherModel? currentWeatherData;
  List<CurrentWeatherModel?> dataList = [];

  HomeController({required this.city});

  @override
  void onInit() {
    initState();
    super.onInit();
  }
  void updateWeather(){
    initState();
  }
  void initState() {
    getWeatherData();
    getFiveWeatherData();
  }

  Future<void> getWeatherData() async{
    var res = await ApiRepo(city: city == '' ? 'giza' : city).getData();
    currentWeatherData = res;
    update();
  }

  Future<void> getFiveWeatherData() async{
    List<String> cities = [
      'alex',
      "helwan",
      "giza",
      'mexico',
      'new york'
    ];
    for (var city in cities) {
      try{
        CurrentWeatherModel res = await ApiRepo(city: city).getData();
        dataList.add(res);
        update();
      }catch(e){
        dataList.add(null);
      }

    }
  }
}

// test