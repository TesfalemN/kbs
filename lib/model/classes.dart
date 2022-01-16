class ClassRoom {
  String? classRoomName;
  String? classRoomCode;
  String? blockNumber;

  ClassRoom();

  factory ClassRoom.fromJson(Map<String, dynamic> json) => ClassRoom()
    ..classRoomName = json["classRoomName"] as String?
    ..blockNumber = json["blockNumber"] as String?
    ..classRoomCode = json["classRoomCode"] as String?;

  Map<String, dynamic> toJson() => {
        "classRoomName": classRoomName,
        "classRoomCode": classRoomCode,
        "blockNumber": blockNumber,
      };
}
