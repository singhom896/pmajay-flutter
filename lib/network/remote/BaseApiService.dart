
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';



abstract class BaseApiService {

  final String baseUrl = "http://164.100.77.235/pmagy/mobile_Api/";
  // login.php?UserId=dl-sw-pmagy&Password=P@m%23g*y5

  final String assesment_end = "api/userprocess/assignmentdetails/format/json/";

  Future<dynamic> getResponse(String url);

  // socialjustice
  Future<dynamic> getUserLogin(String BaseUrl, String UserId,String Password);
  Future<dynamic> getDesignList(String BaseUrl);
  Future<dynamic> getBlockList(String BaseUrl, String DistrictCode);
  Future<dynamic> getGramList(String BaseUrl, String BlockCode);
  Future<dynamic> getVillageList(String BaseUrl, String gpcode);
}