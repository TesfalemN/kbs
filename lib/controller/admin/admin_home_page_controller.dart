import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AdminHomeController extends GetxController {
  bool _isSideMenuOpen = true;
  bool get isSideMenuOpen => _isSideMenuOpen;
  set isSideMenuOpen(bool value) {
    _isSideMenuOpen = value;
    update();
  }

  Widget? _homePageWidget;
  Widget? get homePageWidget => _homePageWidget;
  set homePageWidget(Widget? value) {
    _homePageWidget = value;
    update();
  }
}
