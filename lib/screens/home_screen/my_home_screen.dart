import 'package:campus/data/constants.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:campus/screens/home_screen/widgets/section.dart';
import 'package:campus/screens/home_screen/widgets/slider.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context).width,
      height: getSize(context).height,
      // color: Colors.green,
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          MySlider(),
          Section(
            title: 'Services',
            child: Container(
              width: getSize(context).width,
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(kpadding),
                    child: Container(
                      height: 300,
                      width: 100,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
            other: Padding(
              padding: EdgeInsets.symmetric(horizontal: kpadding),
              child: ElevatedButton(
                onPressed: () {},
                // height: 300,
                // width: 100,
                child: Text('all'),
                // color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
