import 'package:flutter/material.dart';

double kpadding = 18;
enum ScreenState { idle, busy }
enum ReservationState { idle, inList, notInList }
const String localUrl = 'http://127.0.0.1:8000';
const String globalUrl = 'https://nishanapp.pythonanywhere.com';
const String workingUrl = localUrl;
const String studentsEndPoint = '/api/students/search';
hpush(context, Widget page) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
