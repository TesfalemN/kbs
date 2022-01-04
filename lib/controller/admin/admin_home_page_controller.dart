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

  bool _courseDrawer = false;
  bool get courseDrawer => _courseDrawer;
  set courseDrawer(bool value) {
    _courseDrawer = value;
    update();
  }

  bool _classesDrawer = false;
  bool get classesDrawer => _classesDrawer;
  set classesDrawer(bool value) {
    _classesDrawer = value;
    update();
  }

  bool _departmentDrawer = false;
  bool get departmentDrawer => _departmentDrawer;
  set departmentDrawer(bool value) {
    _departmentDrawer = value;
    update();
  }

  bool _instructorDrawer = false;
  bool get instructorDrawer => _instructorDrawer;
  set instructorDrawer(bool value) {
    _instructorDrawer = value;
    update();
  }

  bool _studentDrawer = false;
  bool get studentDrawer => _studentDrawer;
  set studentDrawer(bool value) {
    _studentDrawer = value;
    update();
  }
}
