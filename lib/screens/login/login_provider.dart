import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:campus/data/constants.dart';
import 'package:campus/data/save.dart';
import 'package:campus/main.dart';
import 'package:campus/screens/drawer/drawer.dart';
import 'package:campus/screens/login/login_widgets.dart';
import 'package:campus/screens/login/state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  // ScreenState state = ScreenState.idle;

  AuthNotifier() : super(AuthState.initial());

  void login({context, email, password}) async {
    state = const AuthState.loading();
     final queryParameters = {
      'email': email,
      'password': password,
    };
    var url = Uri.parse('$workingUrl$loginEndPoint');

    // openLoadingDialog(context, 0);
    print(url.toString());
    print('start login provider');

    try {


      await http
          .post(url,
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode({"username": email, "password": password}))

          // print (r.body);
          .then((response) async {
        print(response.body);
        // Navigator.pop(context);
        print('response.statusCode${response.statusCode}');
        var data = json.decode(response.body);
        print(data);
        if (response.statusCode == 200) {



          state = AuthState.authenticated();
          print(data);
          final firsName = data['firstName'] ?? '';
          final secondName = data['secondName'] ?? '';
          final String fullName = firsName +' '+ secondName;
          await saveFullName(fullName);
          container.refresh(userNameProvider);
          final stage = data['stage'] ?? 'first';
          final division = data['division'] ?? 'a';

          await saveStage(stage);
          await saveDivision(division);
          await saveUserID(data['_id']);
          await saveEmail(data['username']);

          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          // showErrorDialog(context, data['errors']);
        }
      }).catchError((e) {
        Navigator.pop(context);
        state = AuthState.notAuthenticated(e.toString());

        showErrorDialog(context, e);
      }) as http.Request;
    } on SocketException catch (e) {
      print('Error: $e');
    } on TimeoutException catch (e) {
      print('Error: $e');
    } on Error catch (e) {
      print('Error: $e');
    }
    // Navigator.pop(context);
  }
}

// print(data['account']['email']);

// await saveFullName(data['account']['first_name'] +
//     ' ' +
//     data['account']['last_name']);
// await saveEmail(data['account']['first_name']);
// await saveToken(data['token']['access']);
// await saveUserID(data['account']['id']);
// await container.refresh(userNameProvider);
