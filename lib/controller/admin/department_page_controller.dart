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

  bool _isUpdateLoading = false;
  bool get isUpdateLoading => _isUpdateLoading;
  set isUpdateLoading(bool value) {
    _isUpdateLoading = value;
    update();
  }

  bool _isDeleteLoading = false;
  bool get isDeleteLoading => _isDeleteLoading;
  set isDeleteLoading(bool value) {
    _isDeleteLoading = value;
    update();
  }

  TextEditingController departmentNameTextEditingController =
      TextEditingController();
  TextEditingController departmentCodeTextEditingController =
      TextEditingController();
  TextEditingController departmentYearTextEditingController =
      TextEditingController();

  TextEditingController updateDepartmentNameTextEditingController =
      TextEditingController();
  TextEditingController updateDepartmentCodeTextEditingController =
      TextEditingController();
  TextEditingController updateDepartmentYearTextEditingController =
      TextEditingController();
  List<String?>? departmentCourse;

  Future<bool> addDepartment() async {
    try {
      await Firestore.setObject(
          Keys.department,
          (Department()
                ..departmentCode = departmentCodeTextEditingController.text
                ..departmentName = departmentNameTextEditingController.text
                ..departmentYear = departmentYearTextEditingController.text)
              .toJson());
    } catch (ex) {
      return false;
    }
    return false;
  }

  Future<bool> updateCourse(String? id) async {
    try {
      await Firestore.firestore?.collection(Keys.department).doc(id).update(
            (Department()
                  ..departmentCode =
                      updateDepartmentCodeTextEditingController.text
                  ..departmentName =
                      updateDepartmentNameTextEditingController.text
                  ..departmentYear =
                      updateDepartmentYearTextEditingController.text)
                .toJson(),
          );
    } catch (ex) {
      return false;
    }
    return false;
  }

  Future<bool> deleteCourse(String? id) async {
    try {
      await Firestore.firestore?.collection(Keys.department).doc(id).delete();
    } catch (ex) {
      return false;
    }
    return false;
  }
}
