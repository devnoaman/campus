import 'package:campus/helpers/helpers.dart';
import 'package:campus/models/student_list_model/student_list_model.dart';
import 'package:campus/screens/home_screen/fragments/students_fragment_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewStudentsFragment extends HookConsumerWidget {
  const ViewStudentsFragment({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var students = ref.watch(stdentsListProvider);
    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          const SliverAppBar(
            title: Text('Students Attendance'),
          ),
          SliverToBoxAdapter(
            child: students.whenOrNull(error: (error) {
              return Text('data');
            }, loaded: (st) {
              return Column(
                  children: st.forEach((e) {
                return Text('data');
              }).toList()
                  // st!.map((e) => Text('hello')).toList() as List<Widget>,
                  );
              // return ListView(
              //   shrinkWrap: true,
              //   children: [Text('noaman monther')

              //  ],
              // );
            }),
          ),
          // SliverAnimatedList(
          //   initialItemCount: 4,
          //   itemBuilder: (context, i, g) {
          //     return StudentsAttendanceCard();
          //   },
          // ),
        ],
      ),
    );
  }
}

class StudentsAttendanceCard extends StatelessWidget {
  const StudentsAttendanceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: getSize(context).width,
        // height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              Expanded(
                  child: Text('Noaman Monther Mahmood',
                      style: TextStyle(fontSize: 20))),
              Container(
                width: 80,
                height: 80,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
