import 'dart:core';

class Department {
  String? departmentName;
  String? departmentCode;
  String? departmentYear;

  Department();

  factory Department.fromJson(Map<String, dynamic> json) => Department()
    ..departmentName = json["departmentName"] as String?
    ..departmentCode = json["departmentCode"] as String?
    ..departmentYear = json["departmentYear"] as String?;

  Map<String, dynamic> toJson() => {
        "departmentName": departmentName,
        "departmentCode": departmentCode,
        "departmentYear": departmentYear,
      };
}
