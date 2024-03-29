import 'package:campus/models/news_model/news.dart';
import 'package:campus/screens/news/news_view.dart';
import 'package:flutter/material.dart';

import 'package:campus/data/constants.dart';
import 'package:campus/helpers/helpers.dart';

class PostCard extends StatelessWidget {
  final News model;
  const PostCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(model);
    return Padding(
      padding: EdgeInsets.all(kpadding),
      child: InkWell(
        onTap: () {
          hpush(
              context,
              NewsView(
                  title: model.title.toString(),
                  description: model.description.toString()));
        },
        child: Container(
          height: getSize(context).height * 0.35,
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
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(36, 36)),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
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
                          model.createdAt.toString(),
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
                    // Icon(Icons.menu)
                  ],
                ),
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kpadding),
                child: Text(model.title.toString(),
                    textAlign: TextAlign.left,
                    maxLines: 2,
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
                        (model.cover == null)
                            ? 'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640'
                            : (model.cover!.startsWith('http'))
                                ? model.cover.toString()
                                : workingUrl + '/' + model.cover.toString(),
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
