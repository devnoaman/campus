
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:campus/data/constants.dart';
import 'package:campus/data/save.dart';
import 'package:campus/models/apps_model.dart';
import 'package:campus/models/apps_model/apps_model.dart';
import 'package:campus/models/discover_model.dart';
import 'package:campus/models/discover_model/discover_model.dart';
import 'package:campus/models/task_model/task_model.dart';
import 'package:campus/screens/discover/discover_screen.dart';
import 'package:campus/screens/login/login_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


final taskProvider = FutureProvider((ref) async {
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
  print (res.body);
  final TaskModel model = TaskModel.fromJson(json.decode(res.body));
  print(model.tasks);
  return model.tasks;
});
