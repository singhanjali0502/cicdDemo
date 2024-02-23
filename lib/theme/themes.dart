import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';


class SettingsController extends GetxController {
  late ThemeData themeData;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _restoreTheme();
  }

  void _restoreTheme() {
    bool isDark = box.read('isDark') ?? true;
    if (isDark) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }

  void storeThemeSetting(bool isDark) {
    box.write('isDark', isDark);
  }
}