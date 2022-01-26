import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/controller/admin/student_page_controller.dart';

class AddStudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(StudentController());
    return GetBuilder<StudentController>(
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
                  'Add New Student',
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
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: controller.studentIdTextEditingController,
                      validator: (value) {
                        return value == null
                            ? 'Enter Student Id'
                            : (2 <= value.length || value.length >= 10)
                                ? null
                                : 'Enter Student Id';
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Enter Student Id',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.badge_outlined,
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
                      height: 20,
                    ),
                    TextFormField(
                      controller:
                          controller.studentFirstNameTextEditingController,
                      validator: (value) {
                        return value == null
                            ? 'Enter Student First Name'
                            : (2 <= value.length || value.length >= 10)
                                ? null
                                : 'Enter Student First Name';
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Enter Student First Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
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
                      height: 20,
                    ),
                    TextFormField(
                      controller:
                          controller.studentLastNameTextEditingController,
                      validator: (value) {
                        return value == null
                            ? 'Enter Student Last Name'
                            : (2 <= value.length || value.length >= 10)
                                ? null
                                : 'Enter Student Last Name';
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Enter Student Last Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
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
                      height: 30,
                    ),
                    TextFormField(
                      controller: controller.studentYearTextEditingController,
                      validator: (value) {
                        return value == null
                            ? 'Enter Student Year'
                            : (2 <= value.length || value.length >= 10)
                                ? null
                                : 'Enter Student Year';
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Enter Student Year',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
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
                      height: 30,
                    ),
                    controller.isLoading
                        ? const SizedBox(
                            child: CupertinoActivityIndicator(
                              radius: 15,
                            ),
                          )
                        : SizedBox(
                            child: MaterialButton(
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
                                    'Add Student',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              color: Keys.primaryColor,
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                controller.isFormValidated = true;
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.isLoading = true;

                                  await controller.addStudent();
                                  controller.studentYearTextEditingController
                                      .clear();
                                  controller
                                      .studentFirstNameTextEditingController
                                      .clear();
                                  controller
                                      .studentLastNameTextEditingController
                                      .clear();
                                  controller.studentIdTextEditingController
                                      .clear();
                                  Get.snackbar(
                                    'Success',
                                    'Student Added Successfully',
                                  );
                                  controller.isLoading = false;
                                }
                              },
                              height: 50,
                              minWidth: 100,
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
