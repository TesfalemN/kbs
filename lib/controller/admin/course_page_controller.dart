import 'package:cloud_firestore/cloud_firestore.dart';
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

  TextEditingController updateCourseNameTextEditingController =
      TextEditingController();
  TextEditingController updateCourCodeTextEditingController =
      TextEditingController();
  TextEditingController updateCourseCreditTextEditingController =
      TextEditingController();

  Stream<QuerySnapshot> coursesStream =
      FirebaseFirestore.instance.collection(Keys.courses).snapshots();

  final Stream<QuerySnapshot> departmentStream =
      FirebaseFirestore.instance.collection(Keys.department).snapshots();

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

  List<String>? departmentCode;

  Future<bool> addCourse() async {
    try {
      await Firestore.setObject(
          Keys.courses,
          (Courses()
                ..courseCode = courCodeTextEditingController.text
                ..coursesName = courseNameTextEditingController.text
                ..courseCredit = courseCreditTextEditingController.text
                ..departmentCodes = departmentCode)
              .toJson());
    } catch (ex) {
      return false;
    }
    return false;
  }

  Future<bool> updateCourse(String? id) async {
    try {
      await Firestore.firestore?.collection(Keys.courses).doc(id).update(
            (Courses()
                  ..courseCode = updateCourCodeTextEditingController.text
                  ..coursesName = updateCourseNameTextEditingController.text
                  ..courseCredit = updateCourseCreditTextEditingController.text)
                .toJson(),
          );
    } catch (ex) {
      return false;
    }
    return false;
  }

  Future<bool> deleteCourse(String? id) async {
    try {
      await Firestore.firestore?.collection(Keys.courses).doc(id).delete();
    } catch (ex) {
      return false;
    }
    return false;
  }

  Future<void> flitterResult(String value) async {
    try {
      var result = await Firestore.firestore
          ?.collection(Keys.login)
          .where('courseCode', isGreaterThanOrEqualTo: value)
          .where(
            'coursesName',
            isGreaterThanOrEqualTo: value,
          )
          .get();
    } catch (ex) {}
  }
}
