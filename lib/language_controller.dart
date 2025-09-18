import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  // Observable variables
  var selectedLanguage = 'English'.obs;
  var selectedLanguageCode = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage();
  }

  // Set language and save to preferences
  void setLanguage(String language, String languageCode) {
    selectedLanguage.value = language;
    selectedLanguageCode.value = languageCode;
    saveLanguageToPrefs(language, languageCode);

    // Update GetX locale
    Get.updateLocale(Locale(languageCode));
  }

  // Get selected language
  String getSelectedLanguage() {
    return selectedLanguage.value;
  }

  // Get selected language code
  String getSelectedLanguageCode() {
    return selectedLanguageCode.value;
  }

  // Save language to SharedPreferences
  Future<void> saveLanguageToPrefs(String language, String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', language);
    await prefs.setString('selected_language_code', languageCode);
  }

  // Load saved language from SharedPreferences
  Future<void> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('selected_language') ?? 'English';
    final savedLanguageCode = prefs.getString('selected_language_code') ?? 'en';

    selectedLanguage.value = savedLanguage;
    selectedLanguageCode.value = savedLanguageCode;

    // Update GetX locale
    Get.updateLocale(Locale(savedLanguageCode));
  }
}
