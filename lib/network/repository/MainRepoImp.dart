import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../remote/BaseApiService.dart';
import '../remote/NetworkApiService.dart';
import '../response/LoginResponse.dart';


class MainRepoImp {


  BaseApiService _apiService = NetworkApiService();



  @override
  Future<String> getUserLogin(String BaseUrl, String username,String password,
      String deviceid,String devicetype,String logintype,String deviceToken ) async
  {

    try {
      dynamic response = await _apiService.getUserLogin(  BaseUrl,  username, password,
           deviceid, devicetype, logintype, deviceToken);

      // final   jsonData = LoginResponse.fromJson(response);
      final   jsonData="";

      return jsonData;
    } catch (e)
    {
      throw e;

    }
  }






}