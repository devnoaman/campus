import 'package:campus/data/constants.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final Widget other;
  final Widget child;
  Section(
      {Key? key,
      required this.title,
      this.other = const SizedBox(),
      this.child = const SizedBox()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kpadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kpadding,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              other
            ],
          ),
          SizedBox(
            height: 12,
          ),
          child
        ],
      ),
    );
  }
}
