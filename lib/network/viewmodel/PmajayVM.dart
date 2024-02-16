import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../data/AddCommittee.dart';
import '../data/SaveCameraLatLong.dart';
import '../remote/ApiResponse.dart';
import '../remote/BaseApiService.dart';
import '../remote/DioUtil.dart';
import '../repository/MainRepoImp.dart';
import '../response/BlockListResponse.dart';

import '../response/DesignationListResponse.dart';
import '../response/GramListResponse.dart';
import '../response/LoginResponse.dart';
import '../response/VillageListResponse.dart';
import 'package:dio/dio.dart' as response; // Import Dio library


class PmajayVM extends ChangeNotifier {

  final _myRepo = MainRepoImp();

  late String? profilePath="" ;

  String? get myProfileData => profilePath;

  set myData(String? _profilePath)
  {
    profilePath = _profilePath;
    notifyListeners();
  }


  late SaveCameraLatLong? saveData;

  SaveCameraLatLong? get getSaveData => saveData;
  set setCameraPick(SaveCameraLatLong saveObj)
  {
    saveData = saveObj;
    notifyListeners();
  }


  late List<AddCommittee?> saveCommitteeList;

  List<AddCommittee?> get getCommitteeList => saveCommitteeList;
  set setAddCommitteeList(List<AddCommittee?> saveCommittee)
  {
    saveCommitteeList = saveCommittee;
    notifyListeners();
  }
  ApiResponse<LoginResponse> loginMain = ApiResponse.loading();
  void _setUserLogin(ApiResponse<LoginResponse> response)
  {
    print("TAG :: $response");
    loginMain = response;
    notifyListeners();
  }
  Future<void>userLoginApi(String BaseUrl, String UserId,String Password) async
  {

    _setUserLogin(ApiResponse.loading());
    _myRepo.getUserLogin( BaseUrl,  UserId, Password).then((value) =>
        _setUserLogin(ApiResponse.completed(value)))

        .onError((error, stackTrace) =>
        _setUserLogin(ApiResponse.error(error.toString())));

  }


  ApiResponse<DesignationListResponse> designationMain = ApiResponse.loading();
  void _setDesigList(ApiResponse<DesignationListResponse> response)
  {
    print("TAG :: $response");
    designationMain = response;
    notifyListeners();
  }
  Future<void>getDesignList(String BaseUrl, String DistrictCode) async
  {

    _setDesigList(ApiResponse.loading());
    _myRepo.getDesignList( BaseUrl).then((value) =>
        _setDesigList(ApiResponse.completed(value))

    )

        .onError((error, stackTrace) =>
        _setDesigList(ApiResponse.error(error.toString())));

  }




  ApiResponse<BlockListResponse> bloackMain = ApiResponse.loading();
  void _setBlockList(ApiResponse<BlockListResponse> response)
  {
    print("TAG :: $response");
    bloackMain = response;
    notifyListeners();
  }
  Future<void>getBlockList(String BaseUrl, String DistrictCode) async
  {

    _setBlockList(ApiResponse.loading());
    _myRepo.getBlockList( BaseUrl,  DistrictCode).then((value) =>
        _setBlockList(ApiResponse.completed(value))

    )

        .onError((error, stackTrace) =>
        _setBlockList(ApiResponse.error(error.toString())));

  }



  ApiResponse<GramListResponse> gramMain = ApiResponse.loading();
  void _setGramList(ApiResponse<GramListResponse> response)
  {
    print("TAG :: $response");
    gramMain = response;
    notifyListeners();
  }
  Future<void>getGramList(String BaseUrl, String BlockCode) async
  {

    _setGramList(ApiResponse.loading());
    _myRepo.getGramList( BaseUrl,  BlockCode).then((value) =>
        _setGramList(ApiResponse.completed(value)))

        .onError((error, stackTrace) =>
        _setGramList(ApiResponse.error(error.toString())));

  }


  ApiResponse<VillageListResponse> villageMain = ApiResponse.loading();
  void _setVillageList(ApiResponse<VillageListResponse> response)
  {
    print("TAG :: $response");
    villageMain = response;
    notifyListeners();
  }
  Future<void>getVillageList(String BaseUrl, String BlockCode) async
  {

    _setVillageList(ApiResponse.loading());
    _myRepo.getVillageList( BaseUrl,  BlockCode).then((value) =>
        _setVillageList(ApiResponse.completed(value)))

        .onError((error, stackTrace) =>
        _setVillageList(ApiResponse.error(error.toString())));

  }

}
