// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// class ThemeService {
//   final _getStorage = GetStorage();
//   final storageKey = "isDarkMode";
//
//   ThemeMode getThemeMode() {
//     return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
//   }
//
//   bool isSavedDarkMode() {
//     return _getStorage.read(storageKey) ?? false;
//   }
//
//   void saveThemeMode(bool isDarkMode) {
//     _getStorage.write(storageKey, isDarkMode);
//   }
//
//   void changeThemeMode() {
//     Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
//     saveThemeMode(isSavedDarkMode());
//   }
// }

import 'package:get_storage/get_storage.dart';

class LocalDB {
  const LocalDB._(GetStorage db) : _db = db;
  final GetStorage _db;
  static LocalDB getInstance() {
    final db = GetStorage();
    return LocalDB._(db);
  }

  Object? getData({required String key}) {
    return _db.read(key);
  }

  void writeString({required key, required String data}) {
    _db.write(key, data);
  }

  void writeInt({required key, required int data}) {
    _db.write(key, data);
  }

  void writeDouble({required key, required double data}) {
    _db.write(key, data);
  }

  void writeBool({required key, required bool data}) {
    _db.write(key, data);
  }
}
class LocalDatabaseKeys {
  static const String cityList = 'cityList';
}