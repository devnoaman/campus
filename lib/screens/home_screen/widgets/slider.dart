import 'package:campus/data/constants.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:campus/screens/adds/adds_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MySlider extends HookConsumerWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var list = ref.watch(addsProvider);
    return CarouselSlider(
      options: CarouselOptions(
          height: 200.0,
          aspectRatio: 16,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          autoPlay: true),
      items: list.map((i) {
        return
          Container(
              width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(vertical: 2.0),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('$workingUrl/${i.cover}')),
                  color: Colors.amber, borderRadius: defaultborder),
            );
      }).toList(),
    );
  }
}
