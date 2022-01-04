import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/controller/admin/admin_home_page_controller.dart';
import 'package:kbs_css/view/admin/add_instructor_page.dart';

class InstructorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'View Instructors',
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
                      AddInstructorPage();
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
          const SizedBox(
            height: 10,
          ),
          Expanded(
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
                    label: Text('Instructor Id'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('Instructor Name'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('Instructor Courses'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('Actions'),
                    size: ColumnSize.L,
                    numeric: true,
                  ),
                ],
                rows: List<DataRow>.generate(
                    100,
                    (index) => DataRow(cells: [
                          DataCell(
                            Text('${index + 1}'),
                          ),
                          const DataCell(
                            Text('CS123'),
                          ),
                          const DataCell(
                            Text('CS123'),
                          ),
                          const DataCell(
                            Text('Computer Science'),
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
                                SizedBox(
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
                        ]))),
          )
        ],
      ),
    );
  }
}
