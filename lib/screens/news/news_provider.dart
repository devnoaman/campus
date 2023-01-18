import 'dart:convert';
import 'package:campus/data/constants.dart';
import 'package:campus/models/apps_model.dart';
import 'package:campus/models/news_model/news_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final newsProvider = FutureProvider((ref) async {
  var url = Uri.parse('$workingUrl/news');

  var res = await http.get(
    url,
  );
  final NewsModel list =
      NewsModel.fromJson(json.decode(res.body)); // json.decode(res.body);
  return list.news;
});
