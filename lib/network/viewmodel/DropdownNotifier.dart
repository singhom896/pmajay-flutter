







import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../remote/DioUtil.dart';
import '../response/BlockListResponse.dart';


class DropdownNotifier extends ChangeNotifier {

  List<BlockResult> _options = [];
  List<BlockResult> get options => _options;
  final dio = Dio();
  final apiService = DioUtil('http://164.100.77.235/pmagy/mobile_Api/');



  Future<void> getBlockList(String BaseUrl, String DistrictCode) async {
    try {


      final  response  = await apiService.getRequest(
          "/getBlock.php?DistrictCode=${DistrictCode}");


      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data; // Don't decode the response again

        // final Map<String, dynamic> responseData = json.decode(response.data);
        BlockListResponse blockListResponse = BlockListResponse.fromJson(responseData);
        // Now you can access the list of BlockResult
        _options = blockListResponse.response!.dataResult!;
        notifyListeners();

      } else {
        throw Exception('Failed to load options');
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }
}
