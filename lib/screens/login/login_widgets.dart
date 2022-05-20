import 'dart:developer';

import 'package:campus/helpers/helpers.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:flutter/material.dart';

void openLoadingDialog(BuildContext context, int index) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return Material(
        color: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Center(
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator()

                    // SizedBox(
                    //   height: (index == 0) ? 36 : 0,
                    // ),
                    // Text(
                    //   (index == 0) ? 'جاري التحميل' : 'جاري تحديد الموقع',
                    //   style: TextStyle(
                    //     color: kPrimaryColor,
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

showErrorDialog(context, errors) async {
  log('errors dialog');
  await showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: EdgeInsets.all(6),
      title: Container(width: 240, child: Icon(Icons.high_quality)),
      content: Container(
        // color: Colors.amber,
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Something went wrong",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
              ),
            ),
            Text(
              "$errors",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      // width: 200,
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'confirm',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
