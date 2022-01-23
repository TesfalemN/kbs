import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/controller/admin/admin_home_page_controller.dart';
import 'package:kbs_css/controller/admin/course_page_controller.dart';
import 'package:kbs_css/view/admin/add_course_page.dart';

class CoursesPage extends StatelessWidget {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'View Courses',
              style: GoogleFonts.kanit(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                    ),
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
                        AddCoursePage();
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
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: controller.coursesStream,
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
                        label: Text('Course Code'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Course Name'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Course Credit'),
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
                        label: Text('Course Code'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Course Name'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Course Credit'),
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
                        label: Text('Course Code'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Course Name'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Course Credit'),
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
                                '${snapshot.data?.docs[index]['courseCode'] ?? ''}'),
                          ),
                          DataCell(
                            Text(
                                '${snapshot.data?.docs[index]['coursesName'] ?? ''}'),
                          ),
                          DataCell(
                            Text(
                                '${snapshot.data?.docs[index]['courseCredit'] ?? ''}'),
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
                                              .updateCourCodeTextEditingController
                                              .text =
                                          snapshot.data?.docs[index]
                                              ['courseCode'];
                                      controller
                                              .updateCourseCreditTextEditingController
                                              .text =
                                          snapshot.data?.docs[index]
                                              ['courseCredit'];
                                      controller
                                              .updateCourseNameTextEditingController
                                              .text =
                                          snapshot.data?.docs[index]
                                              ['coursesName'];
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
                                                    child: const CircleAvatar(
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
                                                Form(
                                                  key: controller.formKey,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Text(
                                                        'Edit Course',
                                                        style: GoogleFonts
                                                            .sourceSansPro(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w800,
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
                                                            .updateCourCodeTextEditingController,
                                                        validator: (value) {
                                                          return value == null
                                                              ? 'Enter Course Code'
                                                              : (2 <= value.length ||
                                                                      value.length >=
                                                                          10)
                                                                  ? null
                                                                  : 'Enter Course Code';
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          isDense: true,
                                                          labelText:
                                                              'Enter Course Code',
                                                          border:
                                                              OutlineInputBorder(),
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .integration_instructions_outlined,
                                                          ),
                                                          labelStyle: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        onChanged: (value) {
                                                          if (controller
                                                              .isFormValidated) {
                                                            controller.formKey
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
                                                            .updateCourseNameTextEditingController,
                                                        validator: (value) {
                                                          return value == null
                                                              ? 'Enter Course Name'
                                                              : (2 <= value.length ||
                                                                      value.length >=
                                                                          10)
                                                                  ? null
                                                                  : 'Enter Course Name';
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          isDense: true,
                                                          labelText:
                                                              'Enter Course Name',
                                                          border:
                                                              OutlineInputBorder(),
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .assignment_outlined,
                                                          ),
                                                          labelStyle: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        onChanged: (value) {
                                                          if (controller
                                                              .isFormValidated) {
                                                            controller.formKey
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
                                                            .updateCourseCreditTextEditingController,
                                                        validator: (value) {
                                                          return value == null
                                                              ? 'Enter Course Credit'
                                                              : (2 <= value.length ||
                                                                      value.length >=
                                                                          10)
                                                                  ? null
                                                                  : 'Enter Course Credit';
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          isDense: true,
                                                          labelText:
                                                              'Enter Course Credit',
                                                          border:
                                                              OutlineInputBorder(),
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .history_toggle_off_outlined,
                                                          ),
                                                          labelStyle: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        onChanged: (value) {
                                                          if (controller
                                                              .isFormValidated) {
                                                            controller.formKey
                                                                .currentState!
                                                                .validate();
                                                          }
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      controller.isUpdateLoading
                                                          ? const SizedBox(
                                                              width: 400,
                                                              child:
                                                                  CupertinoActivityIndicator(
                                                                radius: 15,
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
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                color: Keys
                                                                    .primaryColor,
                                                                onPressed:
                                                                    () async {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  controller
                                                                          .isFormValidated =
                                                                      true;
                                                                  if (controller
                                                                      .formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    controller
                                                                            .isUpdateLoading =
                                                                        true;
                                                                    await controller.updateCourse(snapshot
                                                                        .data
                                                                        ?.docs[
                                                                            index]
                                                                        .id);
                                                                    controller
                                                                        .updateCourseCreditTextEditingController
                                                                        .clear();
                                                                    controller
                                                                        .updateCourseNameTextEditingController
                                                                        .clear();
                                                                    controller
                                                                        .updateCourCodeTextEditingController
                                                                        .clear();
                                                                    Get.back();

                                                                    Get.snackbar(
                                                                      'Success',
                                                                      'Course Updated Successfully',
                                                                    );
                                                                    controller
                                                                            .isUpdateLoading =
                                                                        false;
                                                                  }
                                                                },
                                                                height: 50,
                                                                minWidth: 100,
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
                                                  child: const CircleAvatar(
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                                    backgroundColor: Colors.red,
                                                    radius: 15,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
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
                                                      color:
                                                          Colors.grey.shade500,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: MaterialButton(
                                                          child: const Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                              color: Keys
                                                                  .primaryColor,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          color: Colors.white,
                                                          shape: Border.all(
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
                                                   controller.isDeleteLoading ? const SizedBox(
                                                     width: 400,
                                                     child:
                                                     CupertinoActivityIndicator(
                                                       radius: 15,
                                                     ),
                                                   ):   Expanded(
                                                        child: MaterialButton(
                                                          child: const Text(
                                                            'Delete',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          color: Colors.red,
                                                          onPressed: () async {
                                                            controller
                                                                    .isDeleteLoading =
                                                                true;
                                                            await controller
                                                                .deleteCourse(
                                                                    snapshot
                                                                        .data
                                                                        ?.docs[
                                                                            index]
                                                                        .id);
                                                            Get.back();

                                                            Get.snackbar(
                                                              'Success',
                                                              'Course Deleted Successfully',
                                                            );
                                                            controller
                                                                    .isDeleteLoading =
                                                                false;
                                                          },
                                                          height: 50,
                                                          minWidth: 100,
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
                          'No Course Found',
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
      ),
    );
  }
}
