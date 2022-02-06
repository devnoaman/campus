import 'package:campus/helpers/helpers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200.0,
          aspectRatio: 16,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          autoPlay: true),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(vertical: 2.0),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: defaultborder),
            );
          },
        );
      }).toList(),
    );
  }
}
