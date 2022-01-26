class Student {
  String? studentId;
  String? studentFirstName;
  String? studentLastName;
  String? studentDepartment;
  String? studentYear;

  Student();

  factory Student.fromJson(Map<String, dynamic> json) => Student()
    ..studentId = json["studentId"] as String?
    ..studentFirstName = json["studentFirstName"] as String?
    ..studentLastName = json["studentLastName"] as String?
    ..studentDepartment = json["studentDepartment"] as String?
    ..studentYear = json["studentYear"] as String?;

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "studentFirstName": studentFirstName,
        "studentLastName": studentLastName,
        "studentDepartment": studentDepartment,
        "studentYear": studentYear,
      };
}
