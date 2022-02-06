import 'package:campus/providers/app_language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاعدادات'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () async {
              Provider.of<AppLanguage>(context, listen: false).changeLanguage(
                  (Provider.of<AppLanguage>(context, listen: false).appLocal ==
                          Locale('ar'))
                      ? Locale('en')
                      : Locale('ar'));
              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil('/lan', (route) => false);
            },
            title: Row(
              children: [
                Text(
                    Provider.of<AppLanguage>(context, listen: false).appLocal ==
                            Locale('ar')
                        ? 'Current language'
                        : 'اللغة الحالية'),
                SizedBox(
                  width: 16,
                ),
                Text(
                    Provider.of<AppLanguage>(context, listen: false).appLocal ==
                            Locale('ar')
                        ? 'English'
                        : 'العربية'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
