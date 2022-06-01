import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:campus/data/constants.dart';
import 'package:campus/data/save.dart';
import 'package:campus/main.dart';
import 'package:campus/screens/drawer/drawer.dart';
import 'package:campus/screens/login/login_widgets.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

// incrementCounter(String name) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('fullName', name);
// }

class LoginProvider extends ChangeNotifier {
  ScreenState state = ScreenState.idle;

  void login({context, email, password}) async {
    var port = '';

    final queryParameters = {
      'email': email,
      'password': password,
    };
    var url = Uri.parse('$workingUrl/api/auth/signin');

    // final url = Uri.http('$baseUrl', '/api/auth/signin', queryParameters);

    openLoadingDialog(context, 0);
    print(url.toString());
    print('start login provider');

    try {
      http
          .post(url,
              body: jsonEncode({
                'email': email,
                'password': password,
              }))
          .then((response) async {
        // Navigator.pop(context);
        print('response.statusCode' + response.statusCode.toString());
        var data = json.decode(response.body);
        if (response.statusCode == 200) {
          print(data);
          print(data['account']['email']);

          await saveFullName(data['account']['first_name'] +
              ' ' +
              data['account']['last_name']);
          await saveEmail(data['account']['first_name']);
          await saveToken(data['token']['access']);
          await saveUserID(data['account']['id']);
          await container.refresh(userNameProvider);
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          // showErrorDialog(context, data['errors']);
        }
      }).catchError((e) {
        Navigator.pop(context);

        showErrorDialog(context, e);
      });
    } on SocketException catch (e) {
      print('Error: $e');
    } on TimeoutException catch (e) {
      print('Error: $e');
    } on Error catch (e) {
      print('Error: $e');
    }
    Navigator.pop(context);
  }
}

/*

signIn(String email, String password) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/account/signin');

    try {
      final res = await http.post(url,
          body: jsonEncode({
            'email': email,
            'password': password,
          }));

      var responseBody = jsonDecode(res.body)['account'];
      var tokenResponse = jsonDecode(res.body)['token']['access'];
      tokenValues = jsonDecode(res.body)['token']['access'];

      account=Profile.fromJson(responseBody);
      print(account.id);
      debugPrint('response Type.. ${responseBody.runtimeType}');
      debugPrint('response body.. $responseBody');

      SharedPreferences tokenValueSet=await SharedPreferences.getInstance();
     tokenValueSet.setString('token', tokenResponse);

      debugPrint('response token.. $tokenResponse');

      // debugPrint('response tokenValue.. ${tokenGetter.tokenVal}');
      userId = responseBody['id'];
    } catch (e) {
      print('error...${e}');
    }
    notifyListeners();
  }

  '''*/
