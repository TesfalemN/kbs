import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_css/controller/admin/admin_home_page_controller.dart';
import 'package:kbs_css/view/admin/Instructor_page.dart';
import 'package:kbs_css/view/admin/classes_page.dart';
import 'package:kbs_css/view/admin/course_page.dart';
import 'package:kbs_css/view/admin/department_page.dart';
import 'package:kbs_css/view/admin/student_page.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(AdminHomeController());
    return GetBuilder<AdminHomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              controller.isSideMenuOpen = !controller.isSideMenuOpen;
            },
            child: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  AnimatedContainer(
                    width: controller.isSideMenuOpen ? 300 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.homePageWidget = CoursesPage();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text('Course'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.homePageWidget = DepartmentPage();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text('departemt'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.homePageWidget = ClassRoomPage();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text('Class room'),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(''),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.homePageWidget = InstructorPage();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text('Instractor'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.homePageWidget = StudentPage();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text('student'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: controller.homePageWidget,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: Text(''),
              ),
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
