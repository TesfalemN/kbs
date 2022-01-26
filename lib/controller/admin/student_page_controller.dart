import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/helper/firestore.dart';
import 'package:kbs_css/model/login.dart';
import 'package:kbs_css/model/student.dart';

class StudentController extends GetxController {
  Stream<QuerySnapshot> studentStream =
      FirebaseFirestore.instance.collection(Keys.student).snapshots();

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

  String? departmentCourse;

  TextEditingController studentIdTextEditingController =
      TextEditingController();
  TextEditingController studentFirstNameTextEditingController =
      TextEditingController();
  TextEditingController studentLastNameTextEditingController =
      TextEditingController();
  TextEditingController studentYearTextEditingController =
      TextEditingController();

  TextEditingController updateStudentIdTextEditingController =
      TextEditingController();
  TextEditingController updateStudentFirstNameTextEditingController =
      TextEditingController();
  TextEditingController updateStudentLastNameTextEditingController =
      TextEditingController();
  TextEditingController updateStudentYearTextEditingController =
      TextEditingController();

  Future<bool> addStudent() async {
    try {
      await Firestore.setObject(
          Keys.student,
          (Student()
                ..studentId = studentIdTextEditingController.text
                ..studentFirstName = studentFirstNameTextEditingController.text
                ..studentLastName = studentLastNameTextEditingController.text
                ..studentYear = studentYearTextEditingController.text
                ..studentDepartment = departmentCourse)
              .toJson());

      var password = Random().nextInt(100000).toString();
      await Firestore.setObject(
        Keys.login,
        (Login()
              ..userId = studentIdTextEditingController.text
              ..password = '${sha256.convert(utf8.encode(password))}'
              ..userType = UserType.student.toString().split('.')[1])
            .toJson(),
      );
    } catch (ex) {
      return false;
    }
    return false;
  }

  Future<bool> updateStudent(String? id) async {
    try {
      await Firestore.firestore
          ?.collection(Keys.student)
          .doc(id)
          .update((Student()
                ..studentId = updateStudentIdTextEditingController.text
                ..studentFirstName =
                    updateStudentFirstNameTextEditingController.text
                ..studentLastName =
                    updateStudentLastNameTextEditingController.text
                ..studentYear = updateStudentYearTextEditingController.text
                ..studentDepartment = departmentCourse)
              .toJson());
    } catch (ex) {
      return false;
    }
    return false;
  }

  Future<bool> deleteStudent(String? id) async {
    try {
      await Firestore.firestore?.collection(Keys.student).doc(id).delete();
    } catch (ex) {
      return false;
    }
    return false;
  }
}
