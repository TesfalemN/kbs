class Schedule {
  String? instructorId;
  String? courseCode;
  String? departmentCode;
  String? classCode;
  String? classTime;
  String? classDate;

  Schedule();

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule()
    ..instructorId = json["instructorId"] as String?
    ..courseCode = json["courseCode"] as String?
    ..departmentCode = json["departmentCode"] as String?
    ..classCode = json["classCode"] as String?
    ..classTime = json["classTime"] as String?
    ..classDate = json["classDate"] as String?;

  Map<String, dynamic> toJson() => {
        "instructorId": instructorId,
        "courseCode": courseCode,
        "departmentCode": departmentCode,
        "classCode": classCode,
        "classTime": classTime,
        "classDate": classDate,
      };
}
