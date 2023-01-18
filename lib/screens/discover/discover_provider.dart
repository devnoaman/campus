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
import 'package:campus/screens/discover/discover_screen.dart';
import 'package:campus/screens/login/login_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final discoverProvider = FutureProvider((ref) async {
  var url = Uri.parse('$workingUrl$discoverEndPoint');

  var res = await http.get(
    url,
  );
  final DiscoverModel model = DiscoverModel.fromJson(json.decode(res.body));
  // final List list = json.decode(res.body);
  print(model.discovers);
  return model.discovers;
  // return list.map((e) => DiscoverModel.fromJson(e)).toList();
});

final appsProvider = FutureProvider((ref) async {
  var url = Uri.parse('$workingUrl/apps');

  var res = await http.get(
    url,
  );
  final AppsModel model = AppsModel.fromJson(json.decode(res.body));
  print(model.apps);
  return model.apps;
});
