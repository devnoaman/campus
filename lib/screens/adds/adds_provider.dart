import 'dart:convert';
import 'package:campus/data/constants.dart';
import 'package:campus/models/adds_model/add.dart';
import 'package:campus/models/adds_model/adds_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;


final addsProvider =
    StateNotifierProvider<AddsNotifier, List<Add>>((ref) {
  return AddsNotifier();
});

class AddsNotifier extends StateNotifier<List<Add>> {
  AddsNotifier() : super([]) {
    getData();
  }

  getData() async {
    var url = Uri.parse('$workingUrl$addsEndPoint');

    var res = await http.get(
      url,
    );
    final AddsModel list = AddsModel.fromJson(json.decode(res.body));

    state = [...?list.adds];

  }

  remove(id) async {
    var url = Uri.parse('$workingUrl$eventsEndPoint');

    var res = await http.delete(url, body: {'id': id});

    state = state.where((e) => e.id != id).toList();

  }
}

