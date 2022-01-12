class Courses {
  String? coursesName;
  String? courseCode;
  String? courseCredit;
  Courses();
  factory Courses.fromJson(Map<String, dynamic> json) =>
      Courses()
        ..courseCredit = json["courseCredit"] as String?
        ..coursesName = json["coursesName"] as String?
        ..courseCode = json["courseCode"] as String?;

  Map<String, dynamic> toJson() => {
    "coursesName": coursesName,
    "courseCode": courseCode,
    "courseCredit": courseCredit,
  };
}
