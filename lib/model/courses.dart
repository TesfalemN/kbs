class Courses {
  String? coursesName;
  String? courseCode;
  String? courseCredit;
  List<String>? departmentCodes;
  Courses();
  factory Courses.fromJson(Map<String, dynamic> json) => Courses()
    ..courseCredit = json["courseCredit"] as String?
    ..coursesName = json["coursesName"] as String?
    ..courseCode = json["courseCode"] as String?
    ..departmentCodes =
        List<String>.from((json["departmentCodes"] as List<dynamic>));

  Map<String, dynamic> toJson() => {
        "coursesName": coursesName,
        "courseCode": courseCode,
        "courseCredit": courseCredit,
        "departmentCodes": departmentCodes,
      };
}
