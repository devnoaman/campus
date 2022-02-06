import 'package:campus/data/constants.dart';
import 'package:campus/providers/app_language.dart';
import 'package:campus/providers/screens_provider.dart';
import 'package:campus/screens/settings/settings.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLanguage appLanguage = Provider.of<AppLanguage>(context);

    return Consumer<Screen>(builder: (context, provider, _) {
      return AppBar(
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              provider.openZomDrawer(context);
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => Setting()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Container(
                  decoration: (appLanguage.appLocal == Locale('en'))
                      ? BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(3, 0), // changes position of shadow
                            ),
                          ],
                        )
                      : BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(-3, 0), // changes position of shadow
                            ),
                          ],
                        ),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
            )),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: kPrimaryColor),
        title: Text(
          'campus',
          style: TextStyle(color: kPrimaryColor),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/Notifications');
            },
            child: Icon(Icons.notifications),
          ),
          SizedBox(
            width: kpadding,
          )
        ],
      );
    });
  }
}
