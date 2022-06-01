import 'package:flutter/material.dart';

double kpadding = 18;

enum ScreenState { idle, busy }

enum ReservationState { idle, inList, notInList }

const String localUrl = 'http://127.0.0.1:8000';
const String androidLink = 'http://10.0.2.2:8000';
const String nodeLink = 'https://campusappapi.herokuapp.com';
const String globalUrl = 'https://nishanapp.pythonanywhere.com';
const String workingUrl = nodeLink;
const String studentsEndPoint = '/students/stage/search';
hpush(context, Widget page) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
