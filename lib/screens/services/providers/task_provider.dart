// import 'dart:convert';

// import 'package:campus/models/task_model/task_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart' as http;

// import 'package:campus/data/constants.dart';
// import 'package:campus/data/save.dart';
// // import 'package:campus/models/tasks_model/tasks_model.dart';

// final tasksProvider = FutureProvider((ref) async {
//   var url = Uri.parse('$workingUrl/tasks/monday');
//   print(url);
//   var id = await getUserID();
//   var res = await http.post(url,
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode({"user": id}));

//   final TaskModel list = TaskModel.fromJson(json.decode(res.body));
//   print(list.tasks);
//   // json.decode(res.body);
//   return list.tasks;
// });
