import 'package:campus/compunents/widgets/drawer_button.dart';
import 'package:campus/data/save.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:campus/main.dart';
import 'package:campus/screens/documents/documents.dart';
import 'package:campus/screens/login/login.dart';
import 'package:campus/screens/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'package:campus/helpers/helpers.dart';
import 'package:campus/providers/screens_provider.dart';
import 'package:campus/screens/profile.dart';
import 'package:campus/screens/settings/settings.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userNameProvider = FutureProvider<String>((_) async {
  // String v = await getFullName();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var fullName = prefs.getString('fullName');

  print('value ' + fullName.toString());
  return fullName.toString();
});

class MyDrawer extends ConsumerWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var scr = ref.watch(screenProvider);
    // AppLanguage appLanguage = Provider.of<AppLanguage>(context);
    return SafeArea(
      child: Material(
        child: Container(
          width: getSize(context).width,
          height: getSize(context).height,
          color: kPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                          ref.watch(userNameProvider).maybeWhen(
                              data: (d) => 
                              
                              
                              
                              
                               Container(
                          width: 125,
                          height: 125,
                          child:  Center(
                            child: Text(d[0],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 44)),
                          ),
                           
                               
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(75)),
                        ),
                           orElse: () =>   
                              
                               Container(
                          width: 125,
                          height: 125,
                          child: Center(
                            child:Icon(Icons.supervised_user_circle_rounded)
                          ),
                           
                               
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(75)),
                        ),
                                  ),
                       
                        const SizedBox(
                          height: 16,
                        ),
                        ref.watch(userNameProvider).maybeWhen(
                              data: (d) => Text(d,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24)),
                              orElse: () => Text('error'),
                            ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              Spacer(),
              DrawerButton(
                title: 'الاعدادات',
                icon: Icons.settings,
                onTap: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Setting()));

                  await scr.openZomDrawer(context);
                },
              ),
              // DrawerButton(
              //   title: 'الاستمارات',
              //   icon: Icons.document_scanner,
              //   onTap: () async {
              //     Navigator.of(context)
              //         .push(MaterialPageRoute(builder: (context) => Documents()));

              //     await scr.openZomDrawer(context);
              //   },
              // ),
              // ListTile(
              //   onTap: () async {
              //     Navigator.of(context)
              //         .push(MaterialPageRoute(builder: (context) => Profile()));
              //     // Navigator.of(context)
              //     await scr.openZomDrawer(context);
              //     //     .pushNamedAndRemoveUntil('/lan', (route) => false);
              //   },
              //   leading: Icon(Icons.account_box_sharp, color: Colors.white),
              //   title: Text('الحساب',
              //       style: TextStyle(color: Colors.white, fontSize: 24)),
              // ),
              DrawerButton(
                title: 'مشاركة التطبيق',
                icon: Icons.share,
                onTap: () async {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => Setting()));

                  await scr.openZomDrawer(context);
                },
              ),
              DrawerButton(
                title: 'مقابلات السيد رئيس الجامعة',
                icon: Icons.calendar_today,
                onTap: () async {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => Setting()));

                  await scr.openZomDrawer(context);
                },
              ),
              const Spacer(),
              ListTile(
                onTap: () async {
                container.refresh(authProvider);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Login()));
                  // Navigator.of(context)
                  await scr.openZomDrawer(context);
                  removeFullName();


                  //     .pushNamedAndRemoveUntil('/lan', (route) => false);
                },
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text('تسجيل الخروج',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
