import 'dart:convert';

import 'package:hive/hive.dart';

class CacheStorage {
  CacheStorage();

  static final _storage = Hive.box('KBS');

  Future<Map<String, dynamic>?> getObject(String key) async {
    try {
      if (key.isEmpty) return null;
      var response = await _storage.get(key);
      if (response != null) {
        return json.decode(response);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }

  Future setObject(String key, Map<String, dynamic> value) async {
    try {
      if (key.isEmpty) return null;
      var a = json.encode(value);
      await _storage.put(key, a);
    } catch (exception) {}
  }

  Future<Map<String, dynamic>?> updateObject(
      String key, Map<String, dynamic> value) async {
    try {
      if (key.isEmpty) return null;
      var oldValue = _storage.get(key);
      if (oldValue != null) await removeObject(key);
      await setObject(key, value);
      return value;
    } catch (exception) {
      return null;
    }
  }

  Future<bool> removeObject(String key) async {
    try {
      await _storage.delete(key);
      return true;
    } catch (exception) {
      return false;
    }
  }

  Future<bool> removeAllCache(List<String> keys) async {
    try {
      await _storage.deleteAll(keys);
      return true;
    } catch (exception) {
      return false;
    }
  }
}
