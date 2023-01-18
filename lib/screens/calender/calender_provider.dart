import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:campus/data/constants.dart';
import 'package:campus/data/save.dart';
import 'package:campus/models/apps_model.dart';
import 'package:campus/models/discover_model.dart';
import 'package:campus/models/event_model/event_model.dart';
import 'package:campus/screens/calender/event.dart';
import 'package:campus/screens/discover/discover_screen.dart';
import 'package:campus/screens/login/login_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final calenderListProvider =
    StateNotifierProvider<CalenderNotifier, List<NeatCleanCalendarEvent>>(
        (ref) {
  return CalenderNotifier();
});

class CalenderNotifier extends StateNotifier<List<NeatCleanCalendarEvent>> {
  CalenderNotifier() : super([]) {
    getData();
  }

  add()async{


  var url = Uri.parse('$workingUrl/tasks/monday');
var id = await getUserID();
print(id);
  var res = await http.post(
    url,
      headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
    body:jsonEncode( {
      "user": id
    })
  );
  // print (res.body);
  // print(model.tasks);
  // return model.tasks;


  }

  getData() async {
    var url = Uri.parse('$workingUrl$eventsEndPoint');

    var res = await http.get(
      url,
    );
    final EventModel list = EventModel.fromJson(json.decode(res.body));

    var li = list.events!.map((e) {
      return NeatCleanCalendarEvent(e.summary.toString(),
          id: e.id.toString(),
          startTime: DateTime.parse(e.startTime.toString()),
          endTime: DateTime.parse(e.endTime.toString()),
          color: Colors.indigo);
    }).toList();

    state = [...li];
    // json.decode(res.body);
    // print(list);
    // return li;
  }

  remove(id) async {
    var url = Uri.parse('$workingUrl$eventsEndPoint');

    var res = await http.delete(url, body: {'id': id});

    state = state.where((e) => e.id != id).toList();
    // json.decode(res.body);
    // print(list);
    // return li;
  }
}

final calenderProvider = FutureProvider((ref) async {
  var url = Uri.parse('$workingUrl$eventsEndPoint');

  var res = await http.get(
    url,
  );
  final EventModel list = EventModel.fromJson(json.decode(res.body));

  var li = list.events!.map((e) {
    return NeatCleanCalendarEvent(e.summary.toString(),
        id: e.id.toString(),
        startTime: DateTime.parse(e.startTime.toString()),
        endTime: DateTime.parse(e.endTime.toString()),
        color: Colors.indigo);
  }).toList();

  // json.decode(res.body);
  // print(list);
  return li;
});
