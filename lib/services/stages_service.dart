import 'dart:convert';
import 'package:campus/data/constants.dart';
import 'package:campus/data/save.dart';
import 'package:campus/models/student_list_model.dart';
import 'package:dio/dio.dart';

class StudentsService {
  final Dio _client;

  StudentsService(this._client);

  fetchAll({statge = 'fdeforth', division = 'fefa'}) async {
    var stage = await getStage();
    var division = await getDivision();
    try {
      final response = await _client.get(
        studentsEndPoint,
        queryParameters: {"statge": stage, "division": division},
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      final List resList = await response.data;

      final List<StudentListModel> items = resList.map((e) {
        return StudentListModel.fromJson(e);
      }).toList();
      print(items);

      return items;
    } on DioError catch (ex) {
      throw Exception(ex);
    }
  }
}
