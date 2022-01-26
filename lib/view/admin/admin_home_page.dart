import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/controller/admin/admin_home_page_controller.dart';
import 'package:kbs_css/view/admin/Instructor_page.dart';
import 'package:kbs_css/view/admin/add_class_page.dart';
import 'package:kbs_css/view/admin/add_course_page.dart';
import 'package:kbs_css/view/admin/add_departement_page.dart';
import 'package:kbs_css/view/admin/add_instructor_page.dart';
import 'package:kbs_css/view/admin/add_student_page.dart';
import 'package:kbs_css/view/admin/classes_page.dart';
import 'package:kbs_css/view/admin/course_page.dart';
import 'package:kbs_css/view/admin/department_page.dart';
import 'package:kbs_css/view/admin/student_page.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var adminHomeController = Get.put(AdminHomeController());
    adminHomeController.homePageWidget = mainBody(adminHomeController);
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
                      child: Material(
                        color: Colors.white,
                        elevation: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 10,
                              child: Container(
                                color: Colors.grey.shade200,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.homePageWidget =
                                    mainBody(controller);
                                controller.update();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.radio_button_unchecked_outlined,
                                          color: Colors.green,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Home',
                                          style: GoogleFonts.sourceSansPro(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              color: Colors.grey.shade200,
                              child: const Text(
                                'Master Data',
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                controller.instructorDrawer = false;
                                controller.studentDrawer = false;
                                controller.classesDrawer = false;
                                controller.departmentDrawer = false;
                                controller.courseDrawer =
                                    !controller.courseDrawer;
                                controller.update();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.radio_button_unchecked_outlined,
                                          color: Colors.green,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Courses',
                                          style: GoogleFonts.sourceSansPro(),
                                        ),
                                      ],
                                    ),
                                    RotatedBox(
                                      quarterTurns:
                                          controller.courseDrawer ? 1 : 3,
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.grey.shade500,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: controller.courseDrawer ? 80 : 0,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.homePageWidget = CoursesPage();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .radio_button_unchecked_outlined,
                                                color: Colors.amber,
                                                size: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'View Courses',
                                                style:
                                                    GoogleFonts.sourceSansPro(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.homePageWidget =
                                          AddCoursePage();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .radio_button_unchecked_outlined,
                                                color: Colors.amber,
                                                size: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Add Courses',
                                                style:
                                                    GoogleFonts.sourceSansPro(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.instructorDrawer = false;
                                controller.studentDrawer = false;
                                controller.classesDrawer =
                                    !controller.classesDrawer;
                                controller.departmentDrawer = false;
                                controller.courseDrawer = false;
                                controller.update();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.radio_button_unchecked_outlined,
                                          color: Colors.green,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Classes',
                                          style: GoogleFonts.sourceSansPro(),
                                        ),
                                      ],
                                    ),
                                    RotatedBox(
                                      quarterTurns:
                                          controller.classesDrawer ? 1 : 3,
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.grey.shade500,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              height: controller.classesDrawer ? 80 : 0,
                              duration: const Duration(milliseconds: 500),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.homePageWidget =
                                          ClassRoomPage();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .radio_button_unchecked_outlined,
                                                color: Colors.amber,
                                                size: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'View Classes',
                                                style:
                                                    GoogleFonts.sourceSansPro(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.homePageWidget =
                                          AddClassPage();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .radio_button_unchecked_outlined,
                                                color: Colors.amber,
                                                size: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Add Classes',
                                                style:
                                                    GoogleFonts.sourceSansPro(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.instructorDrawer = false;
                                controller.studentDrawer = false;
                                controller.classesDrawer = false;
                                controller.departmentDrawer =
                                    !controller.departmentDrawer;
                                controller.courseDrawer = false;
                                controller.update();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.radio_button_unchecked_outlined,
                                          color: Colors.green,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Departments',
                                          style: GoogleFonts.sourceSansPro(),
                                        ),
                                      ],
                                    ),
                                    RotatedBox(
                                      quarterTurns:
                                          controller.departmentDrawer ? 1 : 3,
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.grey.shade500,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              height: controller.departmentDrawer ? 80 : 0,
                              duration: const Duration(milliseconds: 500),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.homePageWidget =
                                          DepartmentPage();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .radio_button_unchecked_outlined,
                                                color: Colors.amber,
                                                size: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'View Departments',
                                                style:
                                                    GoogleFonts.sourceSansPro(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.homePageWidget =
                                          AddDepartmentPage();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .radio_button_unchecked_outlined,
                                                color: Colors.amber,
                                                size: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Add Departments',
                                                style:
                                                    GoogleFonts.sourceSansPro(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                              child: Container(
                                color: Colors.grey.shade200,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              color: Colors.grey.shade200,
                              child: const Text(
                                'User Management ',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.instructorDrawer =
                                    !controller.instructorDrawer;
                                controller.studentDrawer = false;
                                controller.classesDrawer = false;
                                controller.departmentDrawer = false;
                                controller.courseDrawer = false;
                                controller.update();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.radio_button_unchecked_outlined,
                                          color: Colors.green,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Instructor',
                                          style: GoogleFonts.sourceSansPro(),
                                        ),
                                      ],
                                    ),
                                    RotatedBox(
                                      quarterTurns:
                                          controller.instructorDrawer ? 1 : 3,
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.grey.shade500,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.homePageWidget =
                                          InstructorPage();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .radio_button_unchecked_outlined,
                                                color: Colors.amber,
                                                size: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'View Instructors',
                                                style:
                                                    GoogleFonts.sourceSansPro(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.homePageWidget =
                                          AddInstructorPage();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .radio_button_unchecked_outlined,
                                                color: Colors.amber,
                                                size: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Add Instructor',
                                                style:
                                                    GoogleFonts.sourceSansPro(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              height: controller.instructorDrawer ? 80 : 0,
                            ),
                            InkWell(
                              onTap: () {
                                controller.instructorDrawer = false;
                                controller.studentDrawer =
                                    !controller.studentDrawer;
                                controller.classesDrawer = false;
                                controller.departmentDrawer = false;
                                controller.courseDrawer = false;
                                controller.update();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.radio_button_unchecked_outlined,
                                          color: Colors.green,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Students',
                                          style: GoogleFonts.sourceSansPro(),
                                        ),
                                      ],
                                    ),
                                    RotatedBox(
                                      quarterTurns:
                                          controller.studentDrawer ? 1 : 3,
                                      child: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.grey.shade500,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: controller.studentDrawer ? 80 : 0,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.homePageWidget = StudentPage();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .radio_button_unchecked_outlined,
                                                color: Colors.amber,
                                                size: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'View Students',
                                                style:
                                                    GoogleFonts.sourceSansPro(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.homePageWidget =
                                          AddStudentPage();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons
                                                    .radio_button_unchecked_outlined,
                                                color: Colors.amber,
                                                size: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Add Students',
                                                style:
                                                    GoogleFonts.sourceSansPro(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
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
            const SizedBox(
              height: 1,
            ),
            Container(
              child: Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
              height: 80,
            ),
          ],
        ),
      ),
    );
  }

  Widget mainBody(AdminHomeController controller) {
    try {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Admin Dashboard',
              style: GoogleFonts.kanit(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.teal.shade400,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                '10',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Students',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Card(
                          color: Colors.blue.shade400,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                '10',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Instructors',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Card(
                          color: Colors.teal.shade400,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                '10',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Department',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Card(
                          color: Colors.redAccent.shade200,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                '10',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Courses',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      await controller.generateSchedule();
                    },
                    color: Keys.primaryColor,
                    height: 50,
                    minWidth: 100,
                    child: const Text(
                      'Generate Schedule',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } catch (ex) {}
    return Container();
  }
}
