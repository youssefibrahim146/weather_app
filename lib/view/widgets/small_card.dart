import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final String name, desc;
  final double temp;

  const SmallCard(
      {required this.name, required this.desc, required this.temp, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${(temp - 273.15).round()}\u2103",
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            "assets/images/pngwing.com.png",
            width: 60,
            height: 60,
          ),
          Text(
            desc,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
