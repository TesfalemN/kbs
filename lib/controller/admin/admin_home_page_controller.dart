import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/helper/firestore.dart';
import 'package:kbs_css/model/Instructor.dart';
import 'package:kbs_css/model/classes.dart';
import 'package:kbs_css/model/courses.dart';
import 'package:kbs_css/model/department.dart';
import 'package:kbs_css/model/schedule.dart';

class AdminHomeController extends GetxController {
  bool _isSideMenuOpen = true;
  bool get isSideMenuOpen => _isSideMenuOpen;
  set isSideMenuOpen(bool value) {
    _isSideMenuOpen = value;
    update();
  }

  Widget? _homePageWidget;
  Widget? get homePageWidget => _homePageWidget;
  set homePageWidget(Widget? value) {
    _homePageWidget = value;
    update();
  }

  bool _courseDrawer = false;
  bool get courseDrawer => _courseDrawer;
  set courseDrawer(bool value) {
    _courseDrawer = value;
    update();
  }

  bool _classesDrawer = false;
  bool get classesDrawer => _classesDrawer;
  set classesDrawer(bool value) {
    _classesDrawer = value;
    update();
  }

  bool _departmentDrawer = false;
  bool get departmentDrawer => _departmentDrawer;
  set departmentDrawer(bool value) {
    _departmentDrawer = value;
    update();
  }

  bool _instructorDrawer = false;
  bool get instructorDrawer => _instructorDrawer;
  set instructorDrawer(bool value) {
    _instructorDrawer = value;
    update();
  }

  bool _studentDrawer = false;
  bool get studentDrawer => _studentDrawer;
  set studentDrawer(bool value) {
    _studentDrawer = value;
    update();
  }

  Future<void> generateSchedule() async {
    try {
      var departments =
          await Firestore.firestore?.collection(Keys.department).get();
      var courses = await Firestore.firestore?.collection(Keys.courses).get();
      var classes = await Firestore.firestore?.collection(Keys.classes).get();
      var instructors =
          await Firestore.firestore?.collection(Keys.instructor).get();
      var schedules =
          await Firestore.firestore?.collection(Keys.schedules).get();

      List<Courses> course = <Courses>[];
      courses?.docs.forEach((element) {
        course.add(Courses.fromJson(element.data()));
      });

      List<Instructor> instructor = <Instructor>[];
      instructors?.docs.forEach((element) {
        instructor.add(Instructor.fromJson(element.data()));
      });

      List<Department> department = <Department>[];
      departments?.docs.forEach((element) {
        department.add(Department.fromJson(element.data()));
      });

      List<ClassRoom> classRoom = <ClassRoom>[];
      classes?.docs.forEach((element) {
        classRoom.add(ClassRoom.fromJson(element.data()));
      });

      if (departments != null && courses != null) {
        for (var depart in department) {
          var depCourses = course
              .where((cour) =>
                  cour.departmentCodes?.contains(depart.departmentCode) ??
                  false)
              .toList();
          for (var depCourse in depCourses) {
            var courseInstructor = instructor
                .where((element) =>
                    element.instructorCourseCodes
                        ?.contains(depCourse.courseCode) ??
                    false)
                .first;
            if (schedules?.docs == null || schedules?.docs.length == 0) {
              var schedule = Schedule()
                ..departmentCode = depart.departmentCode
                ..instructorId = courseInstructor.instructorId
                ..courseCode = depCourse.courseCode
                ..classCode = classes?.docs.first["classRoomCode"];
              await Firestore.setObject(Keys.schedules, schedule.toJson());
            } else {}
          }
        }
      }
    } catch (ex) {
      print(ex);
    }
  }
}

///      get department List
///      foreach department
///         get program type
///           if(program type == Regular)
///              get regular Date and time
///              get course list
///              divide number of course to number of days -> course per day
///              foreach course
///                 get instructor for current course
///                 if(other schedule not found)
///                     divide credit hr with number of days -> min length of hr per day with out round.
///                     divide credit hr with number of days -> max length of hr per day with round.
///                     modulo credit hr with number of days -> total number of days with max hr per day
///                     if(min hr length > 1)
///                         course is every day
///                         foreach days
///                            counter maxCounter = 0;
///                            start time = Random start time
///                            if(maxCounter != maxHrDays)
///                               end time = start time + maxHrDays
///                               maxCounter++
///                            else
///                               end time = start time + minHrDays
///                               Add department Code, Course code, course instructor id, day, and  time, and random class to database
///                     else
///                         course is not every day
///                         modulo credit hr with number of days -> total number of days per week
///                         foreach number of random days
///                             start time = Random start time
///                             end time = start time + minHrDays
///                             Add department Code, Course code, course instructor id, day, and  time, and random class to database
///                 else
///                     divide credit hr with number of days -> min length of hr per day with out round.
///                     divide credit hr with number of days -> max length of hr per day with round.
///                     modulo credit hr with number of days -> total number of days with max hr per day
///                     if(min hr length > 1)
///                         course is every day
///                         foreach days
///                             while (schedule found)
///                                 counter maxCounter = 0;
///                                 start time = Random start time
///                                 if(maxCounter != maxHrDays)
///                                     end time = start time + maxHrDays
///                                     maxCounter++
///                                 else
///                                     end time = start time + minHrDays
///
///                                 if(schedule not matched)
///                                   Add department Code, Course code, course instructor id, day, and  time, and random class to database
///                                   break
///                      else
///                         while(no schedule found )
///                             course is not every day
///                             modulo credit hr with number of days -> total number of days per week
///                             foreach number of random days
///                                 start time = Random start time
///                                 end time = start time + minHrDays
///                               if(schedule not matched)
///                                   Add department Code, Course code, course instructor id, day, and  time, and random class to database
///                                   break
