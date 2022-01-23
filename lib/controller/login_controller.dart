import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/helper/firestore.dart';
import 'package:kbs_css/model/login.dart';
import 'package:kbs_css/view/admin/admin_home_page.dart';
import 'package:kbs_css/view/user/user_home_page.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool isFormValidated = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool _isPasswordShow = false;
  bool get isPasswordShow => _isPasswordShow;
  set isPasswordShow(bool value) {
    _isPasswordShow = value;
    update();
  }

  bool _isUserIdOrPasswordIncorrect = false;
  bool get isUserIdOrPasswordIncorrect => _isUserIdOrPasswordIncorrect;
  set isUserIdOrPasswordIncorrect(bool value) {
    _isUserIdOrPasswordIncorrect = value;
    update();
  }

  TextEditingController userIdTextEditingController = TextEditingController();
  TextEditingController userPasswordTextEditingController =
      TextEditingController();

  Future<bool?> loginUser() async {
    try {
      var password =
          '${sha256.convert(utf8.encode(userPasswordTextEditingController.text))}';
      var userFound = await Firestore.firestore
          ?.collection(Keys.login)
          .where('userId', isEqualTo: userIdTextEditingController.text)
          .where('password', isEqualTo: password)
          .get();
      if (userFound != null && userFound.docs.isNotEmpty) {
        var user = Login.fromJson(userFound.docs.first.data());
        if (user.userType == UserType.admin.toString().split('.')[1]) {
          Get.to(AdminHomePage());
        } else {
          Get.to(UserHomePage());
        }
      } else {
        isUserIdOrPasswordIncorrect = true;
      }
    } catch (ex) {
      print(ex);
    }
  }
}
