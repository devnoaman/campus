import 'package:campus/data/constants.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:flutter/material.dart';

class TopNews extends StatelessWidget {
  const TopNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context).width,
      height: 200,
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
                left: (index == 0) ? kpadding : 0,
                // top: kpadding,
                right: kpadding),
            child: Container(
              width: getSize(context).width * 0.8,
              height: 200,
              decoration:
                  BoxDecoration(borderRadius: defaultborder, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
