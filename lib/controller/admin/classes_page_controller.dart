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

  TextEditingController updateClassRoomCodeTextEditingController =
      TextEditingController();
  TextEditingController updateClassRoomNameTextEditingController =
      TextEditingController();
  TextEditingController updateBlockNumberTextEditingController =
      TextEditingController();

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

  Future<bool> updateClass(String? id) async {
    try {
      await Firestore.firestore?.collection(Keys.classes).doc(id).update(
            (ClassRoom()
                  ..classRoomCode =
                      updateClassRoomCodeTextEditingController.text
                  ..blockNumber = updateBlockNumberTextEditingController.text
                  ..classRoomName =
                      updateClassRoomNameTextEditingController.text)
                .toJson(),
          );
    } catch (ex) {
      return false;
    }
    return false;
  }

  Future<bool> deleteClass(String? id) async {
    try {
      await Firestore.firestore?.collection(Keys.classes).doc(id).delete();
    } catch (ex) {
      return false;
    }
    return false;
  }
}
