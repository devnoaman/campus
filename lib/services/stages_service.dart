import 'dart:convert';
import 'package:campus/data/constants.dart';
import 'package:campus/models/student_list_model/student_list_model.dart';
import 'package:dio/dio.dart';

class StudentsService {
  final Dio _client;

  StudentsService(this._client);
  fetchAll({statge = 'second', division = 'a'}) async {
    try {
      final response = await _client.get(
        studentsEndPoint,
        queryParameters: {"statge": statge, "division": division},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
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
