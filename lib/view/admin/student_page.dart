import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/controller/admin/admin_home_page_controller.dart';
import 'package:kbs_css/controller/admin/student_page_controller.dart';
import 'package:kbs_css/view/admin/add_student_page.dart';

class StudentPage extends StatelessWidget {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'View Students',
                        style: GoogleFonts.kanit(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      MaterialButton(
                        color: Keys.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            4,
                          ),
                        ),
                        height: 55,
                        onPressed: () {
                          Get.find<AdminHomeController>().homePageWidget =
                              AddStudentPage();
                          Get.find<AdminHomeController>().update();
                        },
                        child: Row(
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: controller.studentStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return DataTable2(
                          columnSpacing: 12,
                          horizontalMargin: 12,
                          minWidth: 600,
                          columns: const [
                            DataColumn2(
                              label: Text(
                                'ID',
                              ),
                              size: ColumnSize.S,
                            ),
                            DataColumn2(
                              label: Text('Student Id'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Student Name'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Student Department'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Actions'),
                              size: ColumnSize.L,
                              numeric: true,
                            ),
                          ],
                          rows: List<DataRow>.generate(
                            0,
                            (index) => DataRow(
                              cells: [
                                DataCell(Container()),
                                DataCell(Container()),
                                DataCell(Container()),
                                DataCell(Container()),
                                DataCell(Container()),
                              ],
                            ),
                          ),
                          empty: Column(
                            children: [
                              const Divider(),
                              Text(
                                'Error has occurred',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 20,
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return DataTable2(
                          columnSpacing: 12,
                          horizontalMargin: 12,
                          minWidth: 600,
                          columns: const [
                            DataColumn2(
                              label: Text(
                                'ID',
                              ),
                              size: ColumnSize.S,
                            ),
                            DataColumn2(
                              label: Text('Student Id'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Student Name'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Student Department'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Actions'),
                              size: ColumnSize.L,
                              numeric: true,
                            ),
                          ],
                          rows: List<DataRow>.generate(
                            0,
                            (index) => DataRow(
                              cells: [
                                DataCell(Container()),
                                DataCell(Container()),
                                DataCell(Container()),
                                DataCell(Container()),
                                DataCell(Container()),
                              ],
                            ),
                          ),
                          empty: Column(
                            children: [
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'loading',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const CupertinoActivityIndicator(
                                    radius: 8,
                                  )
                                ],
                              ),
                              const Divider(),
                            ],
                          ),
                        );
                      }
                      return Expanded(
                        child: DataTable2(
                          columnSpacing: 12,
                          horizontalMargin: 12,
                          minWidth: 600,
                          columns: const [
                            DataColumn2(
                              label: Text(
                                'ID',
                              ),
                              size: ColumnSize.S,
                            ),
                            DataColumn2(
                              label: Text('Student Id'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Student Name'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Student Department'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Actions'),
                              size: ColumnSize.L,
                              numeric: true,
                            ),
                          ],
                          rows: List<DataRow>.generate(
                            snapshot.data?.docs.length ?? 0,
                            (index) => DataRow(
                              cells: [
                                DataCell(
                                  Text('${index + 1}'),
                                ),
                                DataCell(
                                  Text(
                                      '${snapshot.data?.docs[index]['studentId'] ?? ''}'),
                                ),
                                DataCell(
                                  Text(
                                      '${snapshot.data?.docs[index]['studentFirstName']} ${snapshot.data?.docs[index]['studentLastName']}'),
                                ),
                                DataCell(
                                  Text(
                                      '${snapshot.data?.docs[index]['studentYear'] ?? ''}'),
                                ),
                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          icon: Icon(
                                            Icons.edit_outlined,
                                            color: Colors.grey.shade700,
                                          ),
                                          onPressed: () {
                                            controller
                                                    .updateStudentIdTextEditingController
                                                    .text =
                                                snapshot.data?.docs[index]
                                                    ['studentId'];
                                            controller
                                                .updateStudentFirstNameTextEditingController
                                                .text = snapshot
                                                    .data?.docs[index]
                                                ['studentFirstName'];
                                            controller
                                                .updateStudentLastNameTextEditingController
                                                .text = snapshot
                                                    .data?.docs[index]
                                                ['studentLastName'];
                                            controller
                                                .updateStudentYearTextEditingController
                                                .text = snapshot
                                                    .data?.docs[index]
                                                ['studentYear'];
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: <Widget>[
                                                      Positioned(
                                                        right: -35.0,
                                                        top: -35.0,
                                                        child: InkResponse(
                                                          onTap: () =>
                                                              Get.back(),
                                                          child:
                                                              const CircleAvatar(
                                                            child: Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            backgroundColor:
                                                                Colors.red,
                                                            radius: 15,
                                                          ),
                                                        ),
                                                      ),
                                                      Form(
                                                        key: controller.formKey,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: <Widget>[
                                                            Text(
                                                              'Edit Student',
                                                              style: GoogleFonts
                                                                  .sourceSansPro(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            const Divider(),
                                                            const SizedBox(
                                                              height: 30,
                                                            ),
                                                            TextFormField(
                                                              controller: controller
                                                                  .updateStudentIdTextEditingController,
                                                              validator:
                                                                  (value) {
                                                                return value ==
                                                                        null
                                                                    ? 'Enter Student Id'
                                                                    : (2 <= value.length ||
                                                                            value.length >=
                                                                                10)
                                                                        ? null
                                                                        : 'Enter Student Id';
                                                              },
                                                              decoration:
                                                                  const InputDecoration(
                                                                isDense: true,
                                                                labelText:
                                                                    'Enter Student Id',
                                                                border:
                                                                    OutlineInputBorder(),
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .badge_outlined,
                                                                ),
                                                                labelStyle:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              onChanged:
                                                                  (value) {
                                                                if (controller
                                                                    .isFormValidated) {
                                                                  controller
                                                                      .formKey
                                                                      .currentState!
                                                                      .validate();
                                                                }
                                                              },
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            TextFormField(
                                                              controller: controller
                                                                  .updateStudentFirstNameTextEditingController,
                                                              validator:
                                                                  (value) {
                                                                return value ==
                                                                        null
                                                                    ? 'Enter Student First Name'
                                                                    : (2 <= value.length ||
                                                                            value.length >=
                                                                                10)
                                                                        ? null
                                                                        : 'Enter Student First Name';
                                                              },
                                                              decoration:
                                                                  const InputDecoration(
                                                                isDense: true,
                                                                labelText:
                                                                    'Enter Student First Name',
                                                                border:
                                                                    OutlineInputBorder(),
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .person_outline_outlined,
                                                                ),
                                                                labelStyle:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              onChanged:
                                                                  (value) {
                                                                if (controller
                                                                    .isFormValidated) {
                                                                  controller
                                                                      .formKey
                                                                      .currentState!
                                                                      .validate();
                                                                }
                                                              },
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            TextFormField(
                                                              controller: controller
                                                                  .updateStudentLastNameTextEditingController,
                                                              validator:
                                                                  (value) {
                                                                return value ==
                                                                        null
                                                                    ? 'Enter Student Last Name'
                                                                    : (2 <= value.length ||
                                                                            value.length >=
                                                                                10)
                                                                        ? null
                                                                        : 'Enter Student Last Name';
                                                              },
                                                              decoration:
                                                                  const InputDecoration(
                                                                isDense: true,
                                                                labelText:
                                                                    'Enter Student Last Name',
                                                                border:
                                                                    OutlineInputBorder(),
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .person_outline_outlined,
                                                                ),
                                                                labelStyle:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              onChanged:
                                                                  (value) {
                                                                if (controller
                                                                    .isFormValidated) {
                                                                  controller
                                                                      .formKey
                                                                      .currentState!
                                                                      .validate();
                                                                }
                                                              },
                                                            ),
                                                            const SizedBox(
                                                              height: 30,
                                                            ),
                                                            TextFormField(
                                                              controller: controller
                                                                  .updateStudentYearTextEditingController,
                                                              validator:
                                                                  (value) {
                                                                return value ==
                                                                        null
                                                                    ? 'Enter Student Year'
                                                                    : (2 <= value.length ||
                                                                            value.length >=
                                                                                10)
                                                                        ? null
                                                                        : 'Enter Student Year';
                                                              },
                                                              decoration:
                                                                  const InputDecoration(
                                                                isDense: true,
                                                                labelText:
                                                                    'Enter Student Year',
                                                                border:
                                                                    OutlineInputBorder(),
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .person_outline_outlined,
                                                                ),
                                                                labelStyle:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              onChanged:
                                                                  (value) {
                                                                if (controller
                                                                    .isFormValidated) {
                                                                  controller
                                                                      .formKey
                                                                      .currentState!
                                                                      .validate();
                                                                }
                                                              },
                                                            ),
                                                            const SizedBox(
                                                              height: 30,
                                                            ),
                                                            controller
                                                                    .isUpdateLoading
                                                                ? const SizedBox(
                                                                    width: 400,
                                                                    child:
                                                                        CupertinoActivityIndicator(
                                                                      radius:
                                                                          15,
                                                                    ),
                                                                  )
                                                                : SizedBox(
                                                                    width: 400,
                                                                    child:
                                                                        MaterialButton(
                                                                      child:
                                                                          const Text(
                                                                        'Update',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                      color: Keys
                                                                          .primaryColor,
                                                                      onPressed:
                                                                          () async {
                                                                        FocusScope.of(context)
                                                                            .unfocus();
                                                                        controller.isFormValidated =
                                                                            true;
                                                                        if (controller
                                                                            .formKey
                                                                            .currentState!
                                                                            .validate()) {
                                                                          controller.isUpdateLoading =
                                                                              true;
                                                                          await controller.updateStudent(snapshot
                                                                              .data
                                                                              ?.docs[index]
                                                                              .id);
                                                                          controller
                                                                              .updateStudentYearTextEditingController
                                                                              .clear();
                                                                          controller
                                                                              .updateStudentFirstNameTextEditingController
                                                                              .clear();
                                                                          controller
                                                                              .updateStudentLastNameTextEditingController
                                                                              .clear();
                                                                          controller
                                                                              .updateStudentIdTextEditingController
                                                                              .clear();
                                                                          Get.back();
                                                                          Get.snackbar(
                                                                            'Success',
                                                                            'Student Updated Successfully',
                                                                          );
                                                                          controller.isUpdateLoading =
                                                                              false;
                                                                        }
                                                                      },
                                                                      height:
                                                                          50,
                                                                      minWidth:
                                                                          100,
                                                                    ),
                                                                  ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          }),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red.shade700,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: <Widget>[
                                                    Positioned(
                                                      right: -35.0,
                                                      top: -35.0,
                                                      child: InkResponse(
                                                        onTap: () => Get.back(),
                                                        child:
                                                            const CircleAvatar(
                                                          child: Icon(
                                                            Icons.close,
                                                            color: Colors.white,
                                                          ),
                                                          backgroundColor:
                                                              Colors.red,
                                                          radius: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Image.network(
                                                          "https://cdn2.iconfinder.com/data/icons/construction-flat/2048/1482_-_Warning_Sign-512.png",
                                                          height: 100,
                                                          width: 100,
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          'This action can\'t be undo',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors
                                                                .grey.shade500,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  MaterialButton(
                                                                child:
                                                                    const Text(
                                                                  'Cancel',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Keys
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                shape:
                                                                    Border.all(
                                                                  color: Keys
                                                                      .primaryColor,
                                                                ),
                                                                onPressed: () =>
                                                                    Get.back(),
                                                                height: 50,
                                                                minWidth: 100,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            controller
                                                                    .isDeleteLoading
                                                                ? const SizedBox(
                                                                    width: 400,
                                                                    child:
                                                                        CupertinoActivityIndicator(
                                                                      radius:
                                                                          15,
                                                                    ),
                                                                  )
                                                                : Expanded(
                                                                    child:
                                                                        MaterialButton(
                                                                      child:
                                                                          const Text(
                                                                        'Delete',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                      color: Colors
                                                                          .red,
                                                                      onPressed:
                                                                          () async {
                                                                        controller.isDeleteLoading =
                                                                            true;
                                                                        await controller.deleteStudent(snapshot
                                                                            .data
                                                                            ?.docs[index]
                                                                            .id);
                                                                        Get.back();

                                                                        Get.snackbar(
                                                                          'Success',
                                                                          'Student Deleted Successfully',
                                                                        );
                                                                        controller.isDeleteLoading =
                                                                            false;
                                                                      },
                                                                      height:
                                                                          50,
                                                                      minWidth:
                                                                          100,
                                                                    ),
                                                                  ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          empty: Column(
                            children: [
                              const Divider(),
                              Text(
                                'No Student Found',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 20,
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ));
  }
}
