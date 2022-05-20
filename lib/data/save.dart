import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

/*
----------------------
token
----------------------
*/

saveToken(token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}

getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  return token;
}

removeToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  var token = prefs.getString('token');
  return token;
}

/*
----------------------
email
----------------------
*/

saveEmail(email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
}

getEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  return email;
}

removeEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('email');
  var email = prefs.getString('email');
  return email;
}

/*
----------------------
name
----------------------
*/

saveFullName(fullName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('fullName', fullName);
}

getFullName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var fullName = prefs.getString('fullName');
  return fullName;
}

removeFullName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('fullName');
  var fullName = prefs.getString('fullName');
  return fullName;
}

savePort(port) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('port', port);
}

getPort() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var port = prefs.getString('port');
  if (port == null) {
    print('port null');
    return 'api-iraqsoft.com:8080';
  }
  return port;
}

removePort() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('port');
  var fullName = prefs.getString('port');
  return fullName;
}

/*
----------------------
user id
----------------------
*/

saveUserID(userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userId', userId);
}

getUserID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userId = prefs.getString('userId');
  return userId;
}

removeUserID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('userId');
  var userId = prefs.getString('userId');
  return userId;
}

/*
----------------------
Announcements
----------------------
*/

Future<List> gettingUnwantedAnnoucements() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? announcementsString = prefs.getString('unwanted_announcements');
  var announces = json.decode("$announcementsString");
  log("$announces".toString());
  log("gettingUnwantedAnnoucements");
  return announces ?? [];
}

Future addingUnwantedAnnounceId(id) async {
  var announcements = await gettingUnwantedAnnoucements();
  for (int i = 0; i < announcements.length; i++) {
    if (announcements[i] == id) {
      log("This item is doublicated");
      return;
    }
  }
  log("adding new item to shared prferences");
  announcements.add(id);
  var announcementsJson = json.encode(announcements);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('unwanted_announcements', announcementsJson);
  return;
}
// welcome screen

saveWelcome(Welcome) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('Welcome', Welcome);
}

getWelcome() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var welcome = prefs.getString('Welcome');
  return welcome;
}

removeWelcome() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('Welcome');
  var token = prefs.getString('Welcome');
  return token;
}
