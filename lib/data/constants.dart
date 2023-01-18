import 'package:flutter/material.dart';

double kpadding = 14;

enum ScreenState { idle, busy }

enum ReservationState { idle, inList, notInList }

const String localUrl = 'http://localhost:3000';
const String androidLink = 'http://10.0.2.2:3000';
const String globalUrl = 'https://camus-backend.herokuapp.com';
const String workingUrl = globalUrl;
const String studentsEndPoint = '/students/stage/search';
const String eventsEndPoint = '/event';
const String loginEndPoint = '/auth/login';
const String notificationsEndPoint = '/notifications';
const String addsEndPoint = '/adds';
const String discoverEndPoint = '/discover';
hpush(context, Widget page) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
