import 'dart:async';
import 'package:campus/data/constants.dart';
import "package:dio/dio.dart";
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Client {
  Dio init() {
    Dio _dio = Dio();
    _dio.options.connectTimeout = 10000; //5s
    _dio.options.receiveTimeout = 3000;
    _dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90),
    );
    _dio.options.baseUrl = workingUrl;
    return _dio;
  }
}
