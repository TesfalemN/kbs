import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool isFormValidated = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  TextEditingController userEmailTextEditingController =
      TextEditingController();

  Future<bool?> forgetPassword() async {
    try {} catch (ex) {
      print(ex);
    }
  }
}
