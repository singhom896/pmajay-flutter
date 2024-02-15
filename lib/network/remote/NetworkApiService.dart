import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;


import 'AppException.dart';
import 'BaseApiService.dart';
import 'DioUtil.dart';

class NetworkApiService extends BaseApiService {



  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 202:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
  @override
  Future getVimeoDataApi(String videoVimeoId) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil("https://api.vimeo.com/videos/");
      Response vimo_response = await apiService.getVimeo(videoVimeoId);

      final httpResponseBody = vimo_response.toString();
      final httpResponse =
          http.Response(httpResponseBody, vimo_response.statusCode ?? 202);

      responseJson = returnResponse(httpResponse);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
  @override
  Future getUserLogin(String BaseUrl, String UserId, String Password) async {
    dynamic responseJson;
    try {


      final apiService = DioUtil(baseUrl);
      Response dioResponse = await apiService.getRequest(
          "/login.php?UserId=${UserId}&Password=${Password}");

      final httpResponseBody = dioResponse.toString();
      final httpResponse =
      http.Response(httpResponseBody, dioResponse.statusCode ?? 403);

      responseJson = returnResponse(httpResponse);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
  @override
  Future getBlockList(String BaseUrl, String DistrictCode) async {
    dynamic responseJson;
    try {


      final apiService = DioUtil(baseUrl);
      Response dioResponse = await apiService.getRequest(
          "/getBlock.php?DistrictCode=${DistrictCode}");

      final httpResponseBody = dioResponse.toString();
      final httpResponse =
      http.Response(httpResponseBody, dioResponse.statusCode ?? 403);

      responseJson = returnResponse(httpResponse);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getGramList(String BaseUrl, String BlockCode) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(baseUrl);
      Response dioResponse = await apiService.getRequest(
          "/getGramPanchayat.php?BlockCode=${BlockCode}");

      final httpResponseBody = dioResponse.toString();
      final httpResponse =
      http.Response(httpResponseBody, dioResponse.statusCode ?? 403);

      responseJson = returnResponse(httpResponse);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


}
