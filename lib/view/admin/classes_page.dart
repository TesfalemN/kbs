import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/controller/admin/admin_home_page_controller.dart';
import 'package:kbs_css/controller/admin/classes_page_controller.dart';

import 'add_class_page.dart';

class ClassRoomPage extends StatelessWidget {
  final Stream<QuerySnapshot> classRoomStream =
      FirebaseFirestore.instance.collection(Keys.classes).snapshots();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View Class Rooms',
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
                        AddClassPage();
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
                        'Add Class Rooms',
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
              stream: classRoomStream,
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
                        label: Text('Class Room Number'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Class Room Name'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Block Number'),
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
                        label: Text('Class Room Number'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Class Room Name'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Block Number'),
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
                        label: Text('Class Room Number'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Class Room Name'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Block Number'),
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
                                '${snapshot.data?.docs[index]['classRoomCode'] ?? ''}'),
                          ),
                          DataCell(
                            Text(
                                '${snapshot.data?.docs[index]['classRoomName'] ?? ''}'),
                          ),
                          DataCell(
                            Text(
                                '${snapshot.data?.docs[index]['blockNumber'] ?? ''}'),
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
                                              .updateClassRoomCodeTextEditingController
                                              .text =
                                          snapshot.data?.docs[index]
                                              ['classRoomCode'];
                                      controller
                                              .updateClassRoomNameTextEditingController
                                              .text =
                                          snapshot.data?.docs[index]
                                              ['classRoomName'];
                                      controller
                                              .updateBlockNumberTextEditingController
                                              .text =
                                          snapshot.data?.docs[index]
                                              ['blockNumber'];
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
                                                        'Edit Class Room',
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
                                                            .updateClassRoomCodeTextEditingController,
                                                        validator: (value) {
                                                          return value == null
                                                              ? 'Enter Class Room Code'
                                                              : (2 <= value.length ||
                                                                      value.length >=
                                                                          10)
                                                                  ? null
                                                                  : 'Enter Class Room Code';
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          isDense: true,
                                                          labelText:
                                                              'Enter Class Room Code',
                                                          border:
                                                              OutlineInputBorder(),
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .meeting_room_outlined,
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
                                                            .updateClassRoomNameTextEditingController,
                                                        validator: (value) {
                                                          return value == null
                                                              ? 'Enter Class Room Name'
                                                              : (2 <= value.length ||
                                                                      value.length >=
                                                                          10)
                                                                  ? null
                                                                  : 'Enter Class Room Name';
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          isDense: true,
                                                          labelText:
                                                              'Enter Class Room Name',
                                                          border:
                                                              OutlineInputBorder(),
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .maps_home_work_outlined,
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
                                                            .updateBlockNumberTextEditingController,
                                                        validator: (value) {
                                                          return value == null
                                                              ? 'Enter Block Number'
                                                              : (2 <= value.length ||
                                                                      value.length >=
                                                                          10)
                                                                  ? null
                                                                  : 'Enter Block Number';
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          isDense: true,
                                                          labelText:
                                                              'Enter Block Number',
                                                          border:
                                                              OutlineInputBorder(),
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .domain_outlined,
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
                                                                    await controller.updateClass(snapshot
                                                                        .data
                                                                        ?.docs[
                                                                            index]
                                                                        .id);
                                                                    controller
                                                                        .updateClassRoomNameTextEditingController
                                                                        .clear();
                                                                    controller
                                                                        .updateClassRoomCodeTextEditingController
                                                                        .clear();
                                                                    controller
                                                                        .updateBlockNumberTextEditingController
                                                                        .clear();
                                                                    Get.back();

                                                                    Get.snackbar(
                                                                      'Success',
                                                                      'Class Room Updated Successfully',
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
                                                      controller.isDeleteLoading
                                                          ? const SizedBox(
                                                              width: 400,
                                                              child:
                                                                  CupertinoActivityIndicator(
                                                                radius: 15,
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
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                color:
                                                                    Colors.red,
                                                                onPressed:
                                                                    () async {
                                                                  controller
                                                                          .isDeleteLoading =
                                                                      true;
                                                                  await controller
                                                                      .deleteClass(snapshot
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
