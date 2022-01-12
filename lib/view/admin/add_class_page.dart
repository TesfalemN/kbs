import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/controller/admin/classes_page_controller.dart';

class AddClassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ClassController());
    return GetBuilder<ClassController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Add New Class Room',
                  style: GoogleFonts.kanit(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            SizedBox(
              width: 550,
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.classRoomCodeTextEditingController,
                      validator: (value) {
                        return value == null
                            ? 'Enter Class Room Code'
                            : (2 <= value.length || value.length >= 10)
                                ? null
                                : 'Enter Class Room Code';
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Class Room Code',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (controller.isFormValidated) {
                          controller.formKey.currentState!.validate();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: controller.classRoomNameTextEditingController,
                      validator: (value) {
                        return value == null
                            ? 'Enter Class Room Name'
                            : (2 <= value.length || value.length >= 10)
                                ? null
                                : 'Enter Class Room Name';
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Class Room Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (controller.isFormValidated) {
                          controller.formKey.currentState!.validate();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    controller.isLoading
                        ? const CupertinoActivityIndicator(
                            radius: 15,
                          )
                        : MaterialButton(
                            color: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                4,
                              ),
                            ),
                            height: 55,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              controller.isFormValidated = true;
                              if (controller.formKey.currentState!.validate()) {
                                controller.isLoading = true;
                                await controller.addClass();
                                controller.classRoomNameTextEditingController
                                    .clear();
                                controller.classRoomCodeTextEditingController
                                    .clear();
                                Get.snackbar(
                                  'Success',
                                  'Class Room Added Successfully',
                                );
                                controller.isLoading = false;
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Add Class Room',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
