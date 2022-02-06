import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          'حسابي',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Notifications');
              },
              child: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(75)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'م. رنا رياض',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 24),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              // width: 125,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 24,
                children: [
                  ProfileButton(
                    title: 'البحوث المنشورة',
                    count: 100,
                  ),
                  ProfileButton(
                    title: 'التقارير',
                    count: 100,
                  ),
                  ProfileButton(
                    title: 'الشهادات',
                    count: 100,
                  ),
                ],
              ),
              // height: 125,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String title;
  final int count;
  const ProfileButton({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
        Text(count.toString(),
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }
}
