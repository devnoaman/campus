import 'package:campus/compunents/widgets/drawer_button.dart';
import 'package:campus/screens/documents/documents.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campus/base.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:campus/providers/app_language.dart';
import 'package:campus/providers/screens_provider.dart';
import 'package:campus/screens/profile.dart';
import 'package:campus/screens/settings/settings.dart';
import 'package:campus/theme/app_theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLanguage appLanguage = Provider.of<AppLanguage>(context);
    return Consumer2<AppLanguage, Screen>(builder: (context, provider, scr, _) {
      return Material(
        child: Container(
          width: getSize(context).width,
          height: getSize(context).height,
          color: kPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 125,
                          height: 125,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(75)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('م',
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                        Text('رنا رياض',
                            style: TextStyle(color: Colors.white, fontSize: 24))
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              // Spacer(),
              DrawerButton(
                title: 'الاعدادات',
                icon: Icons.settings,
                onTap: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Setting()));

                  await scr.openZomDrawer(context);
                },
              ),
              DrawerButton(
                title: 'الاستمارات',
                icon: Icons.document_scanner,
                onTap: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Documents()));

                  await scr.openZomDrawer(context);
                },
              ),
              ListTile(
                onTap: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Profile()));
                  // Navigator.of(context)
                  await scr.openZomDrawer(context);
                  //     .pushNamedAndRemoveUntil('/lan', (route) => false);
                },
                leading: Icon(Icons.account_box_sharp, color: Colors.white),
                title: Text('الحساب',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              DrawerButton(
                title: 'التقويم الجامعي',
                icon: Icons.calendar_today,
                onTap: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Setting()));

                  await scr.openZomDrawer(context);
                },
              ),
              Spacer(),
              ListTile(
                onTap: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Setting()));
                  // Navigator.of(context)
                  await scr.openZomDrawer(context);
                  //     .pushNamedAndRemoveUntil('/lan', (route) => false);
                },
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text('تسجيل الخروج',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
