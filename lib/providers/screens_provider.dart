import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Screen with ChangeNotifier {
  int screen = 0;
  final _drawerController = ZoomDrawerController();

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  GlobalKey<ScaffoldState> get scaffoldKey => _key;
  ZoomDrawerController get zoomDrawer => _drawerController;
  int get activeScreen => screen;

  void increment(int index) {
    screen = index;
    notifyListeners();
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  openZomDrawer(BuildContext context) {
    ZoomDrawer.of(context)!.toggle();
  }
}
