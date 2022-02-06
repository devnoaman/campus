import 'package:campus/base.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:campus/providers/app_language.dart';
import 'package:campus/providers/screens_provider.dart';
import 'package:campus/screens/profile.dart';
import 'package:campus/screens/settings/settings.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
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
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                      Text('رنا رياض',
                          style: TextStyle(color: Colors.white, fontSize: 24))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              ListTile(
                onTap: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Setting()));
                  // Navigator.of(context)
                  await scr.openZomDrawer(context);
                  //     .pushNamedAndRemoveUntil('/lan', (route) => false);
                },
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('الاعدادات',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
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
