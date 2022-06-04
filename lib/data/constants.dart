import 'package:flutter/material.dart';

double kpadding = 18;

enum ScreenState { idle, busy }

enum ReservationState { idle, inList, notInList }

const String localUrl = 'http://localhost:3000';
const String androidLink = 'http://10.0.2.2:3000';
const String nodeLink = 'https://campusappapi.herokuapp.com';
const String globalUrl = 'https://nishanapp.pythonanywhere.com';
const String workingUrl = androidLink;
const String studentsEndPoint = '/students/stage/search';
const String eventsEndPoint = '/event';
const String addsEndPoint = '/adds';
hpush(context, Widget page) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
