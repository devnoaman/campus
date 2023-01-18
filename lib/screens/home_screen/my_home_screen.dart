import 'package:campus/screens/calender/calender.dart';
import 'package:campus/screens/home_screen/fragments/student_view.dart';
import 'package:campus/screens/services/research.dart';
import 'package:campus/screens/services/service.dart';
import 'package:campus/screens/services/time_table.dart';
import 'package:flutter/material.dart';

import 'package:campus/data/constants.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:campus/screens/home_screen/widgets/section.dart';
import 'package:campus/screens/home_screen/widgets/slider.dart';
import 'package:campus/screens/login/login.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context).width,
      height: getSize(context).height,
      // color: Colors.green,
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          MySlider(),
          Section(
            title: 'الخدمات',
            child: Container(
              width: getSize(context).width,
              // height: 120,
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    ServiceCard(
                      title: 'احضار الطلبة',
                      onTap: () {
                        hpush(context, ViewStudentsFragment());
                      },
                      icon: Icons.add,
                    ),
                    ServiceCard(
                      title: 'الاحداث',
                      onTap: () {
                        hpush(context, Calender());
                      },
                      icon: Icons.document_scanner,
                    ),
                    ServiceCard(
                      title: 'جدول المهام',
                      onTap: () {
                        hpush(context, const TimeTable());
                      },
                      icon: Icons.document_scanner,
                    ),
                    ServiceCard(
                      title: 'دليل الترقيات',
                      onTap: () {
                        hpush(context, ServiceScreen());
                      },
                      icon: Icons.document_scanner,
                    ),
                    ServiceCard(
                      title: 'المواقع البحثية',
                      onTap: () {
                        hpush(context, ResearchScreen());
                      },
                      icon: Icons.document_scanner,
                    ),

                    //
                  ]),
            ),
            // other: Padding(
            //   padding: EdgeInsets.symmetric(horizontal: kpadding),
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     // height: 300,
            //     // width: 100,
            //     child: Text('all'),
            //     // color: Colors.red,
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const ServiceCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kpadding),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // height: 120,
          width: getSize(context).width,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(blurRadius: 4, color: Colors.blue.withOpacity(.3))
              ],
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
