import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/controller/admin/course_page_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddCoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CoursePageController());
    return GetBuilder<CoursePageController>(
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
                        'Add New Course',
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
                            controller:
                                controller.courCodeTextEditingController,
                            validator: (value) {
                              return value == null
                                  ? 'Enter Course Code'
                                  : (2 <= value.length || value.length >= 10)
                                      ? null
                                      : 'Enter Course Code';
                            },
                            decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Course Code',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.integration_instructions_outlined,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
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
                            validator: (value) {
                              return value == null
                                  ? 'Enter Course Name'
                                  : (2 <= value.length || value.length >= 10)
                                      ? null
                                      : 'Enter Course Name';
                            },
                            controller:
                                controller.courseNameTextEditingController,
                            decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Course Name',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.assignment_outlined,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
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
                            validator: (value) {
                              return value == null
                                  ? 'Enter Course Credit'
                                  : (2 <= value.length || value.length >= 10)
                                      ? null
                                      : 'Enter Course Credit';
                            },
                            controller:
                                controller.courseCreditTextEditingController,
                            decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Course Credit',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.history_toggle_off_outlined,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
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
                          StreamBuilder<QuerySnapshot>(
                            stream: controller.departmentStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text('Loading');
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text('Loading');
                              }
                              return MultiSelectDialogField(
                                items: (snapshot.data?.docs as List<dynamic>)
                                    .map(
                                      (e) => MultiSelectItem<String?>(
                                        e['departmentCode'],
                                        e['departmentName'],
                                      ),
                                    )
                                    .toList(),
                                listType: MultiSelectListType.LIST,
                                onConfirm: (values) {
                                  controller.departmentCode =
                                      values as List<String>?;
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          controller.isLoading
                              ? const CupertinoActivityIndicator(
                                  radius: 15,
                                )
                              : MaterialButton(
                                  color: Keys.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      4,
                                    ),
                                  ),
                                  height: 55,
                                  onPressed: () async {
                                    FocusScope.of(context).unfocus();
                                    controller.isFormValidated = true;
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.isLoading = true;
                                      await controller.addCourse();
                                      controller
                                          .courseCreditTextEditingController
                                          .clear();
                                      controller.courseNameTextEditingController
                                          .clear();
                                      controller.courCodeTextEditingController
                                          .clear();
                                      Get.snackbar(
                                        'Success',
                                        'Course Added Successfully',
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
                                        width: 10,
                                      ),
                                      Text(
                                        'Add Course',
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
            ));
  }
}
