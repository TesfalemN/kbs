import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/controller/admin/department_page_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddDepartmentPage extends StatelessWidget {
  final Stream<QuerySnapshot> coursesStream =
      FirebaseFirestore.instance.collection(Keys.courses).snapshots();

  @override
  Widget build(BuildContext context) {
    Get.put(DepartmentController());
    return GetBuilder<DepartmentController>(
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
                        'Add New Department',
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
                                controller.departmentCodeTextEditingController,
                            validator: (value) {
                              return value == null
                                  ? 'Enter Department Code'
                                  : (2 <= value.length || value.length >= 10)
                                      ? null
                                      : 'Enter Department Code';
                            },
                            decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Department Code',
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
                            controller:
                                controller.departmentNameTextEditingController,
                            validator: (value) {
                              return value == null
                                  ? 'Enter Department Name'
                                  : (2 <= value.length || value.length >= 10)
                                      ? null
                                      : 'Enter Department Name';
                            },
                            decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Department Name',
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
                            controller:
                                controller.departmentYearTextEditingController,
                            validator: (value) {
                              return value == null
                                  ? 'Enter Department Year'
                                  : (2 <= value.length || value.length >= 10)
                                      ? null
                                      : 'Enter Department Year';
                            },
                            decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Department Year',
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
                          StreamBuilder<QuerySnapshot>(
                            stream: coursesStream,
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
                                        e['courseCode'],
                                        e['coursesName'],
                                      ),
                                    )
                                    .toList(),
                                listType: MultiSelectListType.LIST,
                                onConfirm: (values) {
                                  controller.departmentCourse =
                                      values as List<String?>?;
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
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.isLoading = true;
                                      await controller.addDepartment();
                                      controller
                                          .departmentYearTextEditingController
                                          .clear();
                                      controller
                                          .departmentNameTextEditingController
                                          .clear();
                                      controller
                                          .departmentCodeTextEditingController
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
                                        'Add Department',
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
