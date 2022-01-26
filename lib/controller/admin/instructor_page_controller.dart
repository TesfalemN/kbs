import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/helper/firestore.dart';
import 'package:kbs_css/model/Instructor.dart';
import 'package:kbs_css/model/login.dart';

class InstructorController extends GetxController {
  Stream<QuerySnapshot> instructorStream =
      FirebaseFirestore.instance.collection(Keys.instructor).snapshots();

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

  List<String?>? departmentCourse;

  TextEditingController instructorIdTextEditingController =
      TextEditingController();
  TextEditingController instructorFirstNameTextEditingController =
      TextEditingController();
  TextEditingController instructorLastNameTextEditingController =
      TextEditingController();

  TextEditingController updateInstructorIdTextEditingController =
      TextEditingController();
  TextEditingController updateInstructorFirstNameTextEditingController =
      TextEditingController();
  TextEditingController updateInstructorLastNameTextEditingController =
      TextEditingController();

  Future<bool> addInstructor() async {
    try {
      await Firestore.setObject(
          Keys.instructor,
          (Instructor()
                ..instructorId = instructorIdTextEditingController.text
                ..instructorFirstName =
                    instructorFirstNameTextEditingController.text
                ..instructorLastName =
                    instructorLastNameTextEditingController.text
                ..instructorCourseCodes = departmentCourse)
              .toJson());

      var password = Random().nextInt(100000).toString();
      print(password);
      await Firestore.setObject(
        Keys.login,
        (Login()
              ..userId = instructorIdTextEditingController.text
              ..password = '${sha256.convert(utf8.encode(password))}'
              ..userType = UserType.instructor.toString().split('.')[1])
            .toJson(),
      );
    } catch (ex) {
      return false;
    }
    return false;
  }

  Future<bool> updateInstructor(String? id) async {
    try {
      await Firestore.firestore
          ?.collection(Keys.instructor)
          .doc(id)
          .update((Instructor()
                ..instructorId = updateInstructorIdTextEditingController.text
                ..instructorFirstName =
                    updateInstructorFirstNameTextEditingController.text
                ..instructorLastName =
                    updateInstructorLastNameTextEditingController.text
                ..instructorCourseCodes = departmentCourse)
              .toJson());
    } catch (ex) {
      return false;
    }
    return false;
  }

  Future<bool> deleteInstructor(String? id) async {
    try {
      await Firestore.firestore?.collection(Keys.instructor).doc(id).delete();
    } catch (ex) {
      return false;
    }
    return false;
  }

  List<String> prefix = [
    'PHD',
    'Assoc Prof.',
    'Asst. Prof.',
  ];
}
