import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../remote/BaseApiService.dart';
import '../remote/NetworkApiService.dart';
import '../response/BlockListResponse.dart';
import '../response/DesignationListResponse.dart';
import '../response/GramListResponse.dart';
import '../response/LoginResponse.dart';
import '../response/VillageListResponse.dart';


class MainRepoImp {


  BaseApiService _apiService = NetworkApiService();



  @override
  Future<LoginResponse> getUserLogin(String BaseUrl, String UserId,String Password ) async
  {

    try {
      dynamic response = await _apiService.getUserLogin(  BaseUrl,  UserId, Password);

      final   jsonData = LoginResponse.fromJson(response);
      // final   jsonData="";

      return jsonData;
    } catch (e)
    {
      throw e;

    }
  }

  @override
  Future<DesignationListResponse> getDesignList(String BaseUrl ) async
  {

    try {
      dynamic response = await _apiService.getDesignList(  BaseUrl);

      final   jsonData = DesignationListResponse.fromJson(response);
      // final   jsonData="";

      return jsonData;
    } catch (e)
    {
      throw e;

    }
  }


  @override
  Future<BlockListResponse> getBlockList(String BaseUrl, String DistrictCode ) async
  {

    try {
      dynamic response = await _apiService.getBlockList(  BaseUrl, DistrictCode);

      final   jsonData = BlockListResponse.fromJson(response);
      // final   jsonData="";

      return jsonData;
    } catch (e)
    {
      throw e;

    }
  }

  @override
  Future<GramListResponse> getGramList(String BaseUrl, String BlockCode ) async
  {

    try {
      dynamic response = await _apiService.getGramList(  BaseUrl, BlockCode);

      final   jsonData = GramListResponse.fromJson(response);
      // final   jsonData="";

      return jsonData;
    } catch (e)
    {
      throw e;

    }
  }

  @override
  Future<VillageListResponse> getVillageList(String BaseUrl, String gpcode ) async
  {

    try {
      dynamic response = await _apiService.getVillageList(  BaseUrl, gpcode);

      final   jsonData = VillageListResponse.fromJson(response);
      // final   jsonData="";

      return jsonData;
    } catch (e)
    {
      throw e;

    }
  }

}