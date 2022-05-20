import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:campus/data/constants.dart';
import 'package:campus/data/save.dart';
import 'package:campus/models/apps_model.dart';
import 'package:campus/models/discover_model.dart';
import 'package:campus/screens/discover/discover_screen.dart';
import 'package:campus/screens/login/login_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final discoverProvider = FutureProvider((ref) async {
  var url = Uri.parse('$workingUrl/api/discover/get');

  var res = await http.get(
    url,
  );
  final List list = json.decode(res.body);
  print(list);
  return list.map((e) => DiscoverModel.fromJson(e)).toList();
});

final appsProvider = FutureProvider((ref) async {
  var url = Uri.parse('$workingUrl/api/apps/get');

  var res = await http.get(
    url,
  );
  final List list = json.decode(res.body);
  print(list);
  return list.map((e) => AppsModel.fromJson(e)).toList();
});
