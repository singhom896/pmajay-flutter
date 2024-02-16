import 'dart:async';


// import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'AppString.dart';

class SharedPreferencesHelper {
  static const String _base_url = 'BaseURL';
  static const String _notFirst_Time = 'notFirstTime';
  static const String userlogin = 'userlogin';
  static const String _userType = 'UserType';
  static const String _studentId = 'UserType';
  static const String _name = 'Name';
  static const String _studentName = 'StudentName';


  static Future<String?> getuserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userlogin);
  }
//
//
//
  static Future<void> savePref(String key,String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
//
//   static Future<String?> getUserType() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_userType);
//   }
//
//
//   // static Future<String?> getStudentId() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   return prefs.getString(AppString.pref_student_id);
//   // }
//
//   void listenToSharedPreference(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     String initialValue = prefs.getString(key) ?? '';
//
//     // Create a timer to periodically check for changes in the shared preference
//     Timer.periodic(Duration(seconds: 1), (timer) async {
//       String updatedValue = prefs.getString(key) ?? '';
//       if (updatedValue != initialValue) {
//         print('Shared Preference $key changed to: $updatedValue');
//         initialValue = updatedValue;
//       }
//     });
//   }
//
//
  static Future<String?> getPreferance(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  static Future<void> ClearPreferance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(AppString.pref_Name);
    await prefs.remove(AppString.pref_State);
    await prefs.remove(AppString.pref_StateCode);
    await prefs.remove(AppString.pref_District);
    await prefs.remove(AppString.pref_DistrictCode);
    await prefs.remove('userlogin');
  }
}
