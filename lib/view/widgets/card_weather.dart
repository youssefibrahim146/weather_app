import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatelessWidget {
  final String name, desc;
  final double temp, tempMin, tempMax,wind;

  const WeatherCard(
      {required this.name,
      required this.desc,
      required this.temp,
      required this.tempMin,
      required this.tempMax,
        required this.wind,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            name.toUpperCase(),
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            DateFormat.MMMMEEEEd().format(DateTime.now()),
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      desc,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${(temp - 273.15).round()}\u2103",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Colors.black45,
                              ),
                    ),
                    Text(
                      "min: ${(tempMin - 273.15).round()}\u2103/max: ${(tempMax - 273.15).round()}\u2103",
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    Image.asset('assets/images/pngwing.com.png',
                        fit: BoxFit.cover, width: 80, height: 80),
                    const SizedBox(height: 15),
                    Text(
                      "Wind: $wind ms",
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
