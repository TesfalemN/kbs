class Instructor {
  String? instructorId;
  String? instructorPrefix;
  String? instructorFirstName;
  String? instructorLastName;
  List<String?>? instructorCourseCodes;

  Instructor();

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor()
    ..instructorId = json["instructorId"] as String?
    ..instructorPrefix = json["instructorPrefix"] as String?
    ..instructorFirstName = json["instructorFirstName"] as String?
    ..instructorLastName = json["instructorLastName"] as String?
    ..instructorCourseCodes =
        List<String>.from(json["instructorCourseCodes"] as List<dynamic>);

  Map<String, dynamic> toJson() => {
        "instructorId": instructorId,
        "instructorPrefix": instructorPrefix,
        "instructorFirstName": instructorFirstName,
        "instructorLastName": instructorLastName,
        "instructorCourseCodes": instructorCourseCodes,
      };
}
