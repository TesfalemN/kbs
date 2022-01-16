import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/helper/firestore.dart';
import 'package:kbs_css/model/classes.dart';

class ClassController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool isFormValidated = false;
  TextEditingController classRoomCodeTextEditingController =
      TextEditingController();
  TextEditingController classRoomNameTextEditingController =
      TextEditingController();
  TextEditingController blockNumberTextEditingController =
      TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Future<bool> addClass() async {
    try {
      await Firestore.setObject(
          Keys.classes,
          (ClassRoom()
                ..classRoomCode = classRoomCodeTextEditingController.text
                ..blockNumber = blockNumberTextEditingController.text
                ..classRoomName = classRoomNameTextEditingController.text)
              .toJson());
    } catch (ex) {
      return false;
    }
    return false;
  }
}
