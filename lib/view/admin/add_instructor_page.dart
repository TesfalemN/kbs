import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/controller/admin/instructor_page_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddInstructorPage extends StatelessWidget {
  final Stream<QuerySnapshot> coursesStream =
      FirebaseFirestore.instance.collection(Keys.courses).snapshots();

  @override
  Widget build(BuildContext context) {
    Get.put(InstructorController());
    return GetBuilder<InstructorController>(
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
                  'Add New Instructor',
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
                      controller: controller.instructorIdTextEditingController,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Instructor Id',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return value == null
                            ? 'Enter Instructor Id'
                            : (2 <= value.length || value.length >= 10)
                                ? null
                                : 'Enter Instructor Id';
                      },
                      onChanged: (value) {
                        if (controller.isFormValidated) {
                          controller.formKey.currentState!.validate();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      child: TextFormField(
                        controller:
                            controller.instructorIdTextEditingController,
                        onTap: () {
                          showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                int selectedRadio = 0;
                                return AlertDialog(
                                  content: StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                      return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: prefixList(controller));
                                    },
                                  ),
                                );
                              });
                        },
                        readOnly: true,
                        decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Instructor Prefix',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          return value == null
                              ? 'Enter Instructor Prefix'
                              : (2 <= value.length || value.length >= 10)
                                  ? null
                                  : 'Enter Instructor Prefix';
                        },
                        onChanged: (value) {
                          if (controller.isFormValidated) {
                            controller.formKey.currentState!.validate();
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller:
                          controller.instructorFirstNameTextEditingController,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Instructor First Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return value == null
                            ? 'Enter Instructor First Name'
                            : (2 <= value.length || value.length >= 10)
                                ? null
                                : 'Enter Instructor First Name';
                      },
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
                          controller.instructorLastNameTextEditingController,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Instructor Last Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return value == null
                            ? 'Enter Instructor Last Name'
                            : (2 <= value.length || value.length >= 10)
                                ? null
                                : 'Enter Instructor Last Name';
                      },
                      onChanged: (value) {
                        if (controller.isFormValidated) {
                          controller.formKey.currentState!.validate();
                        }
                      },
                    ),
                    Center(
                      child: PopupMenuButton(
                        child: const Text("Radio PopupMenuButton"),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Radio(
                                  activeColor: Colors.pink,
                                  groupValue: 1,
                                  onChanged: (i) {},
                                  value: 1,
                                ),
                                const Text("Android"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Radio(
                                  groupValue: 1,
                                  onChanged: (i) {},
                                  value: 1,
                                ),
                                const Text("Flutter"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Radio(
                                  groupValue: 1,
                                  onChanged: (i) {},
                                  value: 1,
                                ),
                                const Text("Dart"),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                              if (controller.formKey.currentState!.validate()) {
                                controller.isLoading = true;
                                await controller.addInstructor();
                                controller
                                    .instructorLastNameTextEditingController
                                    .clear();
                                controller
                                    .instructorFirstNameTextEditingController
                                    .clear();
                                controller.instructorIdTextEditingController
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
                                  'Add Instructor',
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

  List<Widget> prefixList(InstructorController controller) {
    List<Widget> buttons = <Widget>[];
    for (var element in controller.prefix) {
      buttons.add(Radio<int>(
        value: controller.prefix.indexOf(element),
        groupValue: 100,
        onChanged: (value) {},
      ));
    }

    return buttons;
  }
}
