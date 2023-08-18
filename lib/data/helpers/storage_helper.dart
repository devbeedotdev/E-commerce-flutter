import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

class StorageHelper {
  static final appLocalStorage = Hive.box('app-local-storage');

  static Future setString(String key, String value) async {
    await appLocalStorage.put(key, value);
  }

  static String? getString(String key) {
    return appLocalStorage.get(key);
  }

  static Future setJson(String key, Map<String, dynamic> value) async {
    await appLocalStorage.put(key, jsonEncode(value));
  }

  static Map<String, dynamic>? getJson(String key) {
    return appLocalStorage.get(key) != null
        ? jsonDecode(appLocalStorage.get(key))
        : null;
  }

  static Future setBool(String key, bool value) async {
    await appLocalStorage.put(key, value);
  }

  static bool? getBool(String key) {
    return appLocalStorage.get(key);
  }

  static Future delete(String key) async {
    await appLocalStorage.delete(key);
  }

  static Future clear() async {
    await appLocalStorage.clear();
  }

  static Future removeAllExcept(List<String> keys) async {
    List<String> keysToRemove = [];
    appLocalStorage.keys.map((key) {
      if (!keys.contains(key)) {
        keysToRemove.add(key);
      }
    });
    await appLocalStorage.deleteAll(keysToRemove);
  }
}
