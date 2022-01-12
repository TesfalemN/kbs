import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/helper/firestore.dart';
import 'package:kbs_css/model/courses.dart';

class CoursePageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool isFormValidated = false;
  TextEditingController courseNameTextEditingController =
      TextEditingController();
  TextEditingController courCodeTextEditingController = TextEditingController();
  TextEditingController courseCreditTextEditingController =
      TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Future<bool> addCourse() async {
    try {
      await Firestore.setObject(
          Keys.courses,
          (Courses()
                ..courseCode = courCodeTextEditingController.text
                ..coursesName = courseNameTextEditingController.text
                ..courseCredit = courseCreditTextEditingController.text)
              .toJson());
    } catch (ex) {
      return false;
    }
    return false;
  }
}
