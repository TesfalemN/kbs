import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/helper/firestore.dart';

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

  Future<void> generateSchedule() async {
    try {
      var departments =
          await Firestore.firestore?.collection(Keys.department).get();
      var courses = await Firestore.firestore?.collection(Keys.courses).get();
      var classes = await Firestore.firestore?.collection(Keys.classes).get();
      var instructors =
          await Firestore.firestore?.collection(Keys.instructor).get();

      if (departments != null) {
        for (var element in departments.docs) {
          //element[]
        }
      }
    } catch (ex) {}
  }
}
