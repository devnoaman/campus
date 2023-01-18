import 'package:campus/models/task_model/task.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:campus/helpers/helpers.dart';
import 'package:campus/models/task_model/task_model.dart';
import 'package:campus/screens/services/tasks_provider.dart';

class TimeTable extends HookConsumerWidget {
  const TimeTable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var taskes = ref.watch(taskProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('جدول المهام'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            ' الجدول الخاص بيوم الاثنين',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 16,
          ),
         Expanded(child: Container(
          child: taskes.mapOrNull(data: (data) {
            return ListView(
              children: data.value!.map((e) =>  TimeTableCard(
                task: e,
             ),).toList(),
            );
          },),
         ))
 
        
        ],
      ),
    );
  }
}

class TimeTableCard extends StatelessWidget {
  final Task task;
  
  const TimeTableCard({
    Key? key,
    required this.task,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: getSize(context).width,
        // height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(task.title.toString()),
            Divider(),
            SizedBox(
              height: 16,
            ),
            Text(
              ' الموقع: ${task.location}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'توقيت البداية: ${task.startTime}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'توقيت النهاية: ${task.endTime}',
              style: TextStyle(fontSize: 20),
            ),
          ]),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 2)]),
      ),
    );
  }
}
