import 'package:flutter/material.dart';

import 'package:campus/data/constants.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:campus/models/news_model/news_model.dart';

class PostCard extends StatelessWidget {
  final NewsModel model;
  const PostCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kpadding),
      child: Container(
        height: getSize(context).height * 0.3,
        width: getSize(context).width,
        decoration: BoxDecoration(
          borderRadius: defaultborder,
          color: const Color(0xffF4F4F4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.elliptical(36, 36)),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.sender.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(22, 30, 84, 1),
                              fontFamily: 'Lato',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                              )),
                      Text(
                        model.created.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(22, 30, 84, 1),
                            fontFamily: 'Lato',
                            fontSize: 12,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                            ),
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.menu)
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kpadding),
              child: Text(model.description.toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Color.fromRGBO(22, 30, 84, 1),
                      fontFamily: 'Lato',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.5 /*PERCENT not supported*/
                      )),
            ),
            Container(
              height: getSize(context).height * 0.2,
              width: getSize(context).width,
              decoration: BoxDecoration(
                borderRadius: defaultborder,
                image: DecorationImage(
                    image: NetworkImage(
                      workingUrl + model.cover.toString(),
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
