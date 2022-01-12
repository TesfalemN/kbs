import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  static FirebaseFirestore? firestore;
  static Future<void> config() async => firestore = FirebaseFirestore.instance;
  static Future<Map<String, dynamic>?> getObject(String key) async =>
      firestore?.collection(key).parameters;
  static Future<void> setObject(String key, Map<String, dynamic> body) async =>
      firestore?.collection(key).add(body);
}
