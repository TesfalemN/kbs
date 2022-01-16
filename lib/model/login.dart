class Login {
  String? userId;
  String? password;
  String? userType;
  Login();

  factory Login.fromJson(Map<String, dynamic> json) => Login()
    ..password = json["password"] as String?
    ..userId = json["userId"] as String?
    ..userType = json["userType"] as String?;

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "password": password,
        "userType": userType,
      };
}

enum UserType { admin, student, instructor }
