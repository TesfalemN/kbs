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
  final Stream<QuerySnapshot> coursesStream =
      FirebaseFirestore.instance.collection(Keys.courses).snapshots();

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
                        width: 5,
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
              stream: coursesStream,
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
                                '${snapshot.data?.docs[index]['coursesName'] ?? ''}'),
                          ),
                          DataCell(
                            Text(
                                '${snapshot.data?.docs[index]['coursesName'] ?? ''}'),
                          ),
                          DataCell(
                            Text(
                                '${snapshot.data?.docs[index]['coursesName'] ?? ''}'),
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
