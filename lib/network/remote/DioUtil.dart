
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

class CorsInterceptor extends Interceptor {
  final String Domain;
  CorsInterceptor(this.Domain);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Access-Control-Allow-Origin'] = Domain; // Replace '*' with your web app's domain
    options.headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS';
    options.headers['Access-Control-Allow-Headers'] = 'X-Requested-With';


    return handler.next(options); // Important: Don't forget to call next(options)
  }
}

class DioUtil {
  final Dio _dio = Dio();



  DioUtil(String baseUrl) {
    // Initialize Dio with default configurations here
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(CorsInterceptor(baseUrl));
    _dio.options.connectTimeout = 60000; // 5 seconds
    _dio.options.receiveTimeout = 60000; // 5 seconds
  }

  // Custom method for making GET requests
  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } catch (error) {
      throw error;
    }
  }

  Future<Response> getVimeo(String endpoint) async {
    try {
      final Map<String, String> headers = {
        'Authorization': 'bearer 8d6afd2f3f5e8c735ac49b45688531dd',
        'Accept': 'application/json',
      };
      _dio.options.headers=headers;
      final response = await _dio.get(endpoint);
      return response;
    } catch (error) {
      throw error;
    }
  }



  Future<Response> post(String endpoint, dynamic? data,String authtoken) async
  {
    try {
      _dio.options.headers['Auth-Token'] = authtoken; // Replace with your custom header
      _dio.options.headers['Content-Type'] = 'application/json'; // Example of another custom header
      _dio.options.headers['Accept'] = 'application/json';

      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (error) {
      throw error;
    }
  }
  Future<Response> postSchoolCode(String endpoint, dynamic data,String host) async
  {
    try {
       _dio.options.headers['Content-Type'] = 'application/json'; // Example of another custom header
       _dio.options.headers['Accept'] = 'application/json';
       _dio.options.headers['Access-Control-Allow-Origin'] = '$host';

      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (error) {
      throw error;
    }
  }
  Future<Response> postHeader(String endpoint, String authtoken) async
  {
    try {
      // _dio.options.headers['Auth-Token'] = authtoken; // Replace with your custom header
      // _dio.options.headers['Content-Type'] = 'application/json'; // Example of another custom header
      //  _dio.options.headers['Accept'] = 'application/json; charset=utf-8';

      final Map<String, String> headers = {
        'Auth-Token': authtoken,
      };
      _dio.options.headers=headers;
      final response = await _dio.post(endpoint);


     //  int? statusCode = response.statusCode;
     //  Map<String, List<String>> headersMap = response.headers.map;
     // // String responseText = response.data.toString();
     // // String responseText = utf8.decode(response.data.toString().runes.toList());
     //
     //  String responseText = response.data.toString().replaceAll(RegExp(r'[\x00-\x1F\x7F-\x9F]'), '');
     //
     //
     //  Map<String, String> headers2 = {};
     //  headersMap.forEach((key, values) {
     //    headers[key] = values.join(", ");
     //  });
     //  // Create an HTTP response using the extracted information
     //  http.Response httpResponse = http.Response(
     //    responseText,
     //    statusCode!,
     //    headers: headers2,
     //  );
     //


    return response;
    } catch (error) {
      throw error;
    }
  }
}





