import 'package:campus/helpers/helpers.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Notifactions extends StatelessWidget {
  const Notifactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: kPrimaryColor),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // Text('Notifactions'),
          NotificationCard(),
          NotificationCard(),
          NotificationCard(),
          NotificationCard(),
          NotificationCard(),
          NotificationCard(),
          NotificationCard(),
          NotificationCard(),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.all(8.0),
                  width: getSize(context).width * 0.30,
                  height: getSize(context).width * 0.30,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                    // image: DecorationImage(
                    //     image: AssetImage('assets/images/salon.jpg'),
                    //     fit: BoxFit.cover),
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Message title',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'SF Pro Display',
                                fontSize: 14,
                                letterSpacing: 0.20000000298023224,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since ...',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(80, 85, 92, 1),
                                fontFamily: 'SF Pro Display',
                                fontSize: 13,
                                letterSpacing: 0.20000000298023224,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Sender',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'SF Pro Display',
                                fontSize: 14,
                                letterSpacing: 0.20000000298023224,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          width: getSize(context).width,
          height: getSize(context).width * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 0),
                  blurRadius: 2)
            ],
            color: Color.fromRGBO(255, 255, 255, 1),
          )),
    );
  }
}
