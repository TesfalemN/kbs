import 'dart:core';

class Department {
  String? departmentName;
  String? departmentCode;
  String? departmentYear;
  List<String?>? departmentCourseCodes;

  Department();
  factory Department.fromJson(Map<String, dynamic> json) => Department()
    ..departmentName = json["departmentName"] as String?
    ..departmentCode = json["departmentCode"] as String?
    ..departmentYear = json["departmentYear"] as String?
    ..departmentCourseCodes = json["departmentCourseCodes"] as List<String>?;

  Map<String, dynamic> toJson() => {
        "departmentName": departmentName,
        "departmentCode": departmentCode,
        "departmentYear": departmentYear,
        "departmentCourse": departmentCourseCodes,
      };
}
