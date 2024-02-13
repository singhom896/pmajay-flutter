import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';




class MyProfileVM extends ChangeNotifier {

  //
  // final _myRepo = MainRepoImp();





  Future<void>userLoginApi(String BaseUrl, String username,String password,
      String deviceid,String devicetype,String logintype,String deviceToken) async
  {

    // _setUserLogin(ApiResponse.loading());
    // _myRepo.getUserLogin( BaseUrl,  username, password,
    //      deviceid, devicetype, logintype, deviceToken).then((value) =>
    //     _setUserLogin(ApiResponse.completed(value)))
    //
    //     .onError((error, stackTrace) =>
    //     _setUserLogin(ApiResponse.error(error.toString())));

  }

  late String? profilePath="" ;

  String? get myProfileData => profilePath;

  set myData(String? _profilePath)
  {
    profilePath = _profilePath;
    notifyListeners();
  }


}
