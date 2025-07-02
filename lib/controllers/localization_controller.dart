// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../models/language_model.dart';
// import '../utils/app_constants.dart';
//
// class LocalizationController extends GetxController implements GetxService {
//   final SharedPreferences sharedPreferences;
//
//
//   LocalizationController({required this.sharedPreferences, }) {
//     loadCurrentLanguage();
//   }
//
//   Locale _locale = Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode);
//   bool _isLtr = true;
//   List<LanguageModel> _languages = [];
//
//   Locale get locale => _locale;
//   bool get isLtr => _isLtr;
//   List<LanguageModel> get languages => _languages;
//
//   void setLanguage(Locale locale) {
//     Get.updateLocale(locale);
//     _locale = locale;
//     if(_locale.languageCode == 'ar') {
//       _isLtr = false;
//     }else {
//       _isLtr = true;
//     }
//     saveLanguage(_locale);
//     update();
//   }
//
//   void toggleLanguage() {
//     if (_locale.languageCode == 'en') {
//       setLanguage(Locale('fr', 'FR'));
//     } else {
//       setLanguage(Locale('en', 'US'));
//     }
//   }
//
//   void loadCurrentLanguage() async {
//     String? langCode = sharedPreferences.getString(AppConstants.LANGUAGE_CODE);
//     String? countryCode = sharedPreferences.getString(AppConstants.COUNTRY_CODE);
//
//     if (langCode == null || countryCode == null) {
//       // No saved language, use default
//       _locale = Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode);
//     } else {
//       _locale = Locale(langCode, countryCode);
//     }
//
//     _isLtr = _locale.languageCode != 'ar';
//
//     // Set selected index accordingly
//     for(int index = 0; index < AppConstants.languages.length; index++) {
//       if(AppConstants.languages[index].languageCode == _locale.languageCode) {
//         _selectedIndex = index;
//         break;
//       }
//     }
//
//     _languages = [];
//     _languages.addAll(AppConstants.languages);
//     update();
//   }
//
//   // void loadCurrentLanguage() async {
//   //   _locale = Locale(sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ?? AppConstants.languages[0].languageCode,
//   //       sharedPreferences.getString(AppConstants.COUNTRY_CODE) ?? AppConstants.languages[0].countryCode);
//   //   _isLtr = _locale.languageCode != 'ar';
//   //   for(int index = 0; index<AppConstants.languages.length; index++) {
//   //     if(AppConstants.languages[index].languageCode == _locale.languageCode) {
//   //       _selectedIndex = index;
//   //       break;
//   //     }
//   //   }
//   //   _languages = [];
//   //   _languages.addAll(AppConstants.languages);
//   //   update();
//   // }
//
//   void saveLanguage(Locale locale) async {
//     sharedPreferences.setString(AppConstants.LANGUAGE_CODE, locale.languageCode);
//     sharedPreferences.setString(AppConstants.COUNTRY_CODE, locale.countryCode??"");
//   }
//
//   int _selectedIndex = 0;
//
//   int get selectedIndex => _selectedIndex;
//
//   void setSelectIndex(int index) {
//     _selectedIndex = index;
//     update();
//   }
//
//   void searchLanguage(String query) {
//     if (query.isEmpty) {
//       _languages  = [];
//       _languages = AppConstants.languages;
//     } else {
//       _selectedIndex = -1;
//       _languages = [];
//       AppConstants.languages.forEach((language) async {
//         if (language.languageName.toLowerCase().contains(query.toLowerCase())) {
//           _languages.add(language);
//         }
//       });
//     }
//     update();
//   }
// }


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/language_model.dart';
import '../utils/app_constants.dart';

class LocalizationController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;

  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }

  Locale _locale = Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode);
  bool _isLtr = true;
  List<LanguageModel> _languages = [];
  int _selectedIndex = 0;

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  List<LanguageModel> get languages => _languages;
  int get selectedIndex => _selectedIndex;

  // ADD THESE MISSING GETTER METHODS
  String get currentLanguageCode => _locale.languageCode;

  String get currentLanguageName {
    for (var language in AppConstants.languages) {
      if (language.languageCode == _locale.languageCode) {
        return language.languageName;
      }
    }
    return _locale.languageCode.toUpperCase();
  }

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    if(_locale.languageCode == 'ar') {
      _isLtr = false;
    } else {
      _isLtr = true;
    }
    saveLanguage(_locale);
    update();
  }

  // void toggleLanguage() {
  //   if (_locale.languageCode == 'en') {
  //     setLanguage(Locale('fr', 'FR'));
  //   } else {
  //     setLanguage(Locale('en', 'US'));
  //   }
  // }

  void loadCurrentLanguage() async {
    String? langCode = sharedPreferences.getString(AppConstants.LANGUAGE_CODE);
    String? countryCode = sharedPreferences.getString(AppConstants.COUNTRY_CODE);

    if (langCode == null || countryCode == null) {
      // No saved language, use default
      _locale = Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode);
    } else {
      _locale = Locale(langCode, countryCode);
    }

    _isLtr = _locale.languageCode != 'ar';

    // Set selected index accordingly
    for(int index = 0; index < AppConstants.languages.length; index++) {
      if(AppConstants.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }

    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }

  void saveLanguage(Locale locale) async {
    sharedPreferences.setString(AppConstants.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(AppConstants.COUNTRY_CODE, locale.countryCode ?? "");
  }

  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void searchLanguage(String query) {
    if (query.isEmpty) {
      _languages = [];
      _languages.addAll(AppConstants.languages);
    } else {
      _selectedIndex = -1;
      _languages = [];
      // Fixed: Remove async from forEach and use regular for loop
      for (var language in AppConstants.languages) {
        if (language.languageName.toLowerCase().contains(query.toLowerCase())) {
          _languages.add(language);
        }
      }
    }
    update();
  }
}