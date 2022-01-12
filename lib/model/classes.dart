class ClassRoom {
  String? classRoomName;
  String? classRoomCode;
  ClassRoom();
  factory ClassRoom.fromJson(Map<String, dynamic> json) => ClassRoom()
    ..classRoomName = json["classRoomName"] as String?
    ..classRoomCode = json["classRoomCode"] as String?;

  Map<String, dynamic> toJson() => {
        "classRoomName": classRoomName,
        "classRoomCode": classRoomCode,
      };
}
