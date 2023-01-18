import 'dart:convert';
import 'package:campus/data/constants.dart';
import 'package:campus/data/save.dart';
import 'package:campus/models/notifications_model/notification.dart';
import 'package:campus/models/notifications_model/notifications_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

final notificationsProvider =
    StateNotifierProvider<NotificationsNotifier, List<MyNotification>>((ref) {
  return NotificationsNotifier();
});

class NotificationsNotifier extends StateNotifier<List<MyNotification>> {
  NotificationsNotifier() : super([]) {
    getData();
  }

  getData() async {
    var id = await getUserID();
    var url = Uri.parse('$workingUrl$notificationsEndPoint');
    print(url);
    var res = await http.post(
      url,
      body: jsonEncode({
        "user":id
      })
    );
    final NotificationsModel list =
        NotificationsModel.fromJson(json.decode(res.body));
    print(list.notifications);

    state = [...?list.notifications];
  }
}
