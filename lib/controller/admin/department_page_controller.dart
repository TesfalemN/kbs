import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/helper/firestore.dart';
import 'package:kbs_css/model/department.dart';

class DepartmentController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool isFormValidated = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  TextEditingController departmentNameTextEditingController =
      TextEditingController();
  TextEditingController departmentCodeTextEditingController =
      TextEditingController();
  TextEditingController departmentYearTextEditingController =
      TextEditingController();
  List<String?>? departmentCourse;

  Future<bool> addDepartment() async {
    try {
      await Firestore.setObject(
          Keys.department,
          (Department()
                ..departmentCode = departmentCodeTextEditingController.text
                ..departmentName = departmentNameTextEditingController.text
                ..departmentYear = departmentYearTextEditingController.text
                ..departmentCourseCodes = departmentCourse)
              .toJson());
    } catch (ex) {
      return false;
    }
    return false;
  }
}
