import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:weather_app/controller/home_controller.dart';

import 'widgets/card_weather.dart';
import 'widgets/small_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: HomeController(city: "cairo"),
        builder: (controller) {
          if (controller.currentWeatherData == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/cloud-in-blue-sky.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Stack(
                        children: [
                          AppBar(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            leading: IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 100, left: 20, right: 20),
                            child: TextField(
                              onChanged: (value) => controller.city = value,
                              style: const TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) =>
                                  controller.updateWeather(),
                              decoration: InputDecoration(
                                suffix: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                hintStyle: const TextStyle(color: Colors.white),
                                hintText: 'Search'.toUpperCase(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 1),
                            child: SizedBox(
                              height: 10,
                              width: 10,
                              child: OverflowBox(
                                minWidth: 0.0,
                                maxWidth: MediaQuery.of(context).size.width,
                                minHeight: 0.0,
                                maxHeight:
                                    (MediaQuery.of(context).size.height / 3),
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: WeatherCard(
                                        name:
                                            controller.currentWeatherData!.name,
                                        desc: controller.currentWeatherData!
                                            .weather[0].description,
                                        temp: controller.currentWeatherData!
                                            .mainWeather.temp,
                                        tempMin: controller.currentWeatherData!
                                            .mainWeather.temp_min,
                                        tempMax: controller.currentWeatherData!
                                            .mainWeather.temp_max,
                                        wind: controller
                                            .currentWeatherData!.wind.speed,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 150, left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'other city'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 16,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(
                                  height: 205,
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          const VerticalDivider(
                                            color: Colors.black26,
                                            width: 5,
                                          ),
                                      itemCount: controller.dataList.length,
                                      itemBuilder: (context, index) {
                                        if (controller.dataList[index]==null||controller.dataList.length<index) {
                                          return const SizedBox(
                                            width: 100,
                                              child: CircularProgressIndicator());
                                        }
                                        return SmallCard(
                                          name:
                                              controller.dataList[index]!.name,
                                          desc: controller.dataList[index]!
                                              .weather[0].description,
                                          temp: controller.dataList[index]!
                                              .mainWeather.temp,
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
