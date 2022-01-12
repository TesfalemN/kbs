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
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'View Class Rooms',
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
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.teal,
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
                        label: Text('Class Room Code'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Class Room Name'),
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
                        label: Text('Class Room Code'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Class Room Name'),
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
                        label: Text('Class Room Code'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Class Room Name'),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    color: Colors.grey.shade700,
                                  ),
                                  onPressed: () {},
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red.shade700,
                                  ),
                                  onPressed: () {},
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
