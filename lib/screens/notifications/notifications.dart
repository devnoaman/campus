import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:campus/helpers/helpers.dart';
import 'package:campus/models/notifications_model/notification.dart';
import 'package:campus/screens/notifications/notifications_provider.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:link_text/link_text.dart';

class Notifactions extends ConsumerWidget {
  const Notifactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(notificationsProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'التبليغات',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: kPrimaryColor),
        actions: [
          IconButton(
              onPressed: () {
                ref.refresh(notificationsProvider);
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: ListView(
          physics: BouncingScrollPhysics(),
          children: ref
              .watch(notificationsProvider)
              .map((e) => NotificationCard(
                    myNotification: e,
                  ))
              .toList()),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final MyNotification myNotification;
  const NotificationCard({
    Key? key,
    required this.myNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinkText(
                myNotification.title.toString(),
                ),
                SizedBox(
                  height: 10,
                ),
               Expanded(
                  child: Container(
                    child: LinkText(
                      myNotification.description.toString(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      myNotification.sender.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'SF Pro Display',
                          fontSize: 14,
                          letterSpacing: 0.20000000298023224,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    Text(
                      myNotification.createdAt!.toUtc().toString(),
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
          width: getSize(context).width,
          height: getSize(context).width * 0.6,
          decoration: BoxDecoration(
            borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(.3),
                  offset: Offset(0, 0),
                  blurRadius: 5)
            ],
            color: Color.fromRGBO(255, 255, 255, 1),
          )),
    );
  }
}
