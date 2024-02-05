import 'dart:async';


import 'package:shared_preferences/shared_preferences.dart';

import 'AppString.dart';

class SharedPreferencesHelper {
  static const String _base_url = 'BaseURL';
  static const String _notFirst_Time = 'notFirstTime';
  static const String _authkey = 'AuthKey';
  static const String _userType = 'UserType';
  static const String _studentId = 'UserType';
  static const String _name = 'Name';
  static const String _studentName = 'StudentName';


  // Get the username from shared preferences
  static Future<String?> getBaseURL() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_base_url);
  }

  // Set the username in shared preferences
  static Future<void> saveBaseURL(String base_url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_base_url, base_url);
  }


  // Get the username from shared preferences
  static Future<String?> getNoFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_notFirst_Time);
  }

  // Set the username in shared preferences
  static Future<void> saveNoFirstTime(String notFirstTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_notFirst_Time, notFirstTime);
  }

  // Set the username in shared preferences
  static Future<void> saveAuthKey(String authkey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authkey, authkey);
  }

  static Future<String?> getAuthKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authkey);
  }



  static Future<void> saveUserType(String userType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userType, userType);
  }

  static Future<String?> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userType);
  }


  // static Future<String?> getStudentId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(AppString.pref_student_id);
  // }

  void listenToSharedPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String initialValue = prefs.getString(key) ?? '';

    // Create a timer to periodically check for changes in the shared preference
    Timer.periodic(Duration(seconds: 1), (timer) async {
      String updatedValue = prefs.getString(key) ?? '';
      if (updatedValue != initialValue) {
        print('Shared Preference $key changed to: $updatedValue');
        initialValue = updatedValue;
      }
    });
  }


  static Future<String?> getPreferance(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  static Future<void> savePreferance(String key,String _value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, _value);
  }
  static Future<void> ClearPreferance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authkey);
    await prefs.remove(_userType);
    await prefs.remove(_name);
//parent preferance


  }
}
