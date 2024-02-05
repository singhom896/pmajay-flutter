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
  Future getGetAssesment(
      String authtoken, String BaseUrl, String articleId) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "a_id": articleId,
      };
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/assignmentdetails/format/json/",
          requestBody,
          authtoken);

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
  Future savePlayerPosition(String BaseUrl, String authToken, String videoid,
      String seek_position) async {
    dynamic responseJson;
    try {
      FormData formData = FormData.fromMap({
        'videoid': videoid,
        'seek_position': seek_position,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/contentapi/managevideoplay/format/json/", formData, authToken);

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
  Future uploadFile(
    String BaseUrl,
    String authToken,
    String publishId,
    File fileToUpload,
  ) async {
    dynamic responseJson;

    try {
      FormData formData = FormData.fromMap({
        'publishid': publishId,
        'uploadfile': await MultipartFile.fromFile(
          fileToUpload.path,
          filename: fileToUpload.uri.pathSegments.last,
        ),
      });

      // api/userprocess/studentuploadassignment/format/json/
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/studentuploadassignment/format/json/",
          formData,
          authToken);

      final httpResponseBody = dioResponse.toString();
      final httpResponse =
          http.Response(httpResponseBody, dioResponse.statusCode ?? 403);

      responseJson = returnResponse(httpResponse);
    } catch (e) {
      throw e;
    }
    return responseJson;
  }

  @override
  Future getVideoList(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      //  final apiService = DioUtil(BaseUrl);
      //  Response  dioResponse = await apiService.postHeader("api/contentapi/studentclassvideo/format/json/",authToken);
      //  List<dynamic> httpResponseBody = jsonDecode(dioResponse.toString());
      //
      // // final httpResponseBody = dioResponse.toString();
      //  final httpResponse = http.Response(httpResponseBody.toString(),dioResponse.statusCode??202);
      //
      //
      //  responseJson = returnResponse(httpResponse);

      final Map<String, String> headers = {
        'Auth-Token': authToken,
      };
      http.Response dioResponse = await http
          .post(
              Uri.parse(
                  BaseUrl + "api/contentapi/studentclassvideo/format/json/"),
              headers: headers)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(dioResponse);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getschoolCode(
      String BaseUrl, String SchoolCode, BuildContext context) async {
    dynamic responseJson;
    try {
      final requestBody = {"schoolcode": SchoolCode};
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postSchoolCode(
          "api/masterapi/findschool/format/json", requestBody, BaseUrl);

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
  Future getUserLogin(
      String BaseUrl,
      String username,
      String password,
      String deviceid,
      String devicetype,
      String logintype,
      String deviceToken) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "username": username,
        "password": password,
        "deviceid": deviceid,
        "devicetype": devicetype,
        "logintype": logintype,
        "deviceToken": deviceToken,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postSchoolCode(
          "api/user/login/format/json/", requestBody, BaseUrl);

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
  Future getAllSubjectList(
      String BaseUrl, String authToken, String boardid, String classid) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "boardid": boardid,
        "classid": classid,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/contentapi/classsubjectlist/format/json",
          requestBody,
          authToken);

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
  Future teacherBoardList(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postHeader(
          "api/contentapi/boardlist/format/json/", authToken);

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
  Future getUpcomingHomework(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postHeader(
          "api/userprocess/upcommingtest/format/json/", authToken);

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
  Future getMyProfile(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postHeader(
          "api/userprocess/myprofile/format/json/", authToken);

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
  Future gettimeTable(String BaseUrl, String authToken, String studentid,
      String usertype) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "studentid": studentid,
        "usertype": usertype,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/timetableapi/todayclassschedule/format/json/",
          requestBody,
          authToken);

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
  Future getContentList(String BaseUrl, String authToken, String boardid,
      String classid, String subjectid, String chapterid) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "boardid": boardid,
        "classid": classid,
        "subjectid": subjectid,
        "chapter": chapterid,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/contentapi/viewcontent/format/json/", requestBody, authToken);

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
  Future getContentDetails(String BaseUrl, String authToken, String contentid,
      String chapterid) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "contentid": contentid,
        "chapterid": chapterid,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/contentapi/viewchaptercontent/format/json/",
          requestBody,
          authToken);

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
  Future assignPublishStudentList(String BaseUrl, String authToken,
      String logintype, String aststus, String childid) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "logintype": logintype,
        "aststus": aststus,
        "childid": childid,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/assignmentpublishstudentlist/format/json/",
          requestBody,
          authToken);

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
  Future getPublishAssignmentList(
      String BaseUrl, String authToken, String usertype) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "logintype": usertype,
        "ap_id": "",
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/assignmentpublishlist/format/json/",
          requestBody,
          authToken);

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
  Future getverifiedAssignList(
      String BaseUrl, String authToken, String usertype, String ap_id) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "logintype": usertype,
        "ap_id": "",
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/assignmentverifylist/format/json/",
          requestBody,
          authToken);

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
  Future assignStudentSubmitCheckList(
      String BaseUrl, String authToken, String usertype, String aststus) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "logintype": usertype,
        "childid": "",
        "aststus": aststus,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/assignmentstudentsubmitchecklist/format/json/",
          requestBody,
          authToken);

      final httpResponseBody = dioResponse.toString();
      final httpResponse =
          http.Response(httpResponseBody, dioResponse.statusCode ?? 403);

      responseJson = returnResponse(httpResponse);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  // AssignStudSubCheckListRes
  @override
  Future totalPublishStudentList(
      String BaseUrl, String authToken, String usertype, String ap_id) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "logintype": usertype,
        "ap_id": ap_id,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/assignmentstudentpublishlist/format/json/",
          requestBody,
          authToken);

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
  Future assignDetail(String BaseUrl, String authToken, String ap_id) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "a_id": ap_id,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/assignmentdetails/format/json/",
          requestBody,
          authToken);

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
  Future verifiedStudentList(String BaseUrl, String authToken, String ap_id,
      String boardId, String classId) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "a_id": ap_id,
        "boardid": boardId,
        "classid": classId,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/getstudentlistbyboardclass/format/json/",
          requestBody,
          authToken);

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
  Future getVerifiedPublish(String BaseUrl, String authToken, String usertype,
      String a_id, String lastsdate, String a_student) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "a_id": a_id,
        "lastsdate": lastsdate,
        "a_student": a_student,
        "usertype": usertype,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/publishassignment/format/json/",
          requestBody,
          authToken);

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
  Future unCheckedAssignDetailforgrade(
      String BaseUrl, String authToken, String publishid) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "publishid": publishid,
        "grade": "",
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/uncheckedassignmentdetailforgrade/format/json/",
          requestBody,
          authToken);

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
  Future checkedAssignment(
      String BaseUrl, String authToken, String publishid, String grade) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "publishid": publishid,
        "grade": grade,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/checkedassignment/format/json/",
          requestBody,
          authToken);

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
  Future getAsesessListForStudent(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postHeader(
          "api/assessment/studentassessmentlist/format/json/", authToken);

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
  Future getAsesessInformation(
      String BaseUrl, String authToken, String ap_id) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({'ap_id': ap_id});

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/assessment/studentassessmentdetails/format/json/",
          formData,
          authToken);

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
  Future getAssessQuestionForStudent(
      String BaseUrl,
      String authToken,
      String type,
      String ap_id,
      String selectquestionstatus,
      String questioncount_id) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "ap_id": ap_id,
        "selectquestionstatus": selectquestionstatus,
        "questioncount_id": questioncount_id,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/assessment/getquestionforstudent/format/json/",
          requestBody,
          authToken);
      final httpResponseBody = dioResponse.toString();
      Map<String, dynamic> jsonData = json.decode(httpResponseBody);

      //final httpResponse = http.Response(jsonData,dioResponse.statusCode??403);

      //responseJson = returnResponse(httpResponse);
      responseJson = jsonData;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  // @override
  // Future getSubmitAssessQuestion(String BaseUrl, String authToken,
  //     SubmitAssessQuestionRequest request) async {
  //   dynamic responseJson;
  //   try {
  //     // final requestBody = {
  //     //   "ap_id": ap_id,
  //     //   "selectquestionstatus": selectquestionstatus,
  //     //   "questioncount_id": questioncount_id,
  //     //
  //     // };
  //
  //     final apiService = DioUtil(BaseUrl);
  //     Response dioResponse = await apiService.post(
  //         "api/assessment/submitstudentassessmentforadaptive/format/json/",
  //         request,
  //         authToken);
  //
  //     final httpResponseBody = dioResponse.toString();
  //     final httpResponse =
  //         http.Response(httpResponseBody, dioResponse.statusCode ?? 403);
  //
  //     responseJson = returnResponse(httpResponse);
  //   } on SocketException {
  //     throw FetchDataException('No Internet Connection');
  //   }
  //   return responseJson;
  // }

  // @override
  // Future submitAsesessQuestion(String BaseUrl, String authToken,
  //     SubmitAssessQuestionRequest request) async {
  //   dynamic responseJson;
  //   try {
  //     // final requestBody = {
  //     //   "ap_id": ap_id,
  //     //   "selectquestionstatus": selectquestionstatus,
  //     //   "questioncount_id": questioncount_id,
  //     //
  //     // };
  //     String json_data = jsonEncode(request.toJson());
  //
  //     final apiService = DioUtil(BaseUrl);
  //     Response dioResponse = await apiService.post(
  //         "api/assessment/submitstudentassessment/format/json/",
  //         json_data,
  //         authToken);
  //
  //     final httpResponseBody = dioResponse.toString();
  //     final httpResponse =
  //         http.Response(httpResponseBody, dioResponse.statusCode ?? 403);
  //
  //     responseJson = returnResponse(httpResponse);
  //   } on SocketException {
  //     throw FetchDataException('No Internet Connection');
  //   }
  //   return responseJson;
  // }

  @override
  Future getAssessResultList(String BaseUrl, String authToken, String logintype,
      String studentid) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'logintype': logintype,
        'studentid': studentid,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/assessment/studentassessmentresultlist/format/json/",
          formData,
          authToken);
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
  Future getAssessResultDetail(String BaseUrl, String authToken, String ap_id,
      String logintype, String studentid) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "ap_id": ap_id,
        "logintype": logintype,
        "studentid": studentid,
      };
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/assessment/studentassessmentresult/format/json/",
          requestBody,
          authToken);
      final httpResponseBody = dioResponse.toString();
      Map<String, dynamic> jsonData = json.decode(httpResponseBody);

      // final httpResponse = http.Response(httpResponseBody,dioResponse.statusCode??403);
      //
      // responseJson = returnResponse(httpResponse);
      responseJson = jsonData;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getAssessResultlistForSc(
      String BaseUrl, String authToken, String logintype) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'logintype': logintype,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/assessment/assessmentresultlistforsc/format/json",
          formData,
          authToken);
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
  Future getPublishAssessResult(
      String BaseUrl, String authToken, String ap_id) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'ap_id': ap_id,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/assessment/assessmentresultpublish/format/json/",
          formData,
          authToken);
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
  Future getAssessStudentResultlistForSc(
      String BaseUrl, String authToken, String logintype, String ap_id) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'ap_id': ap_id,
        'logintype': logintype,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/assessment/studentassessmentresultlistforsc/format/json/",
          formData,
          authToken);
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
  Future getAssessmentDetail(
      String BaseUrl, String authToken, String a_id) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'a_id': a_id,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/assessment/assessmentdetails/format/json/", formData, authToken);

      final httpResponseBody = dioResponse.toString();

      // Map<String, dynamic> jsonData = json.decode(httpResponseBody);
      // responseJson=jsonData;
      try {
        // final httpResponse = http.Response(httpResponseBody, dioResponse.statusCode!!);
        //
        // responseJson = returnResponse(httpResponse);

        Map<String, dynamic> jsonData = json.decode(httpResponseBody);
        responseJson=jsonData;
      } catch (e) {
        print(e);
        print('HTTP Response Body: $httpResponseBody');

      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getExamListForStudent(String BaseUrl, String authToken,
      String logintype, String studentid, String resultstatus) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'logintype': logintype,
        'studentid': studentid,
        'resultstatus': resultstatus,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/examination/studentpublishedlist/format/json/",
          formData,
          authToken);
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
  Future getExamInformationForStudent(
      String BaseUrl, String authToken, String ap_id) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({'ap_id': ap_id});

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/examination/studentexaminfo/format/json/", formData, authToken);

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
  Future getExamQuestion(
      String BaseUrl,
      String authToken,
      String type,
      String ap_id,
      String selectquestionstatus,
      String questioncount_id) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "ap_id": ap_id,
        "selectquestionstatus": selectquestionstatus,
        "questioncount_id": questioncount_id,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/examination/getquestionforstudent/format/json/",
          requestBody,
          authToken);
      final httpResponseBody = dioResponse.toString();
      Map<String, dynamic> jsonData = json.decode(httpResponseBody);

      responseJson = jsonData;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
  //
  // @override
  // Future submitExamQuestion(String BaseUrl, String authToken,
  //     SubmitAssessQuestionRequest request) async {
  //   dynamic responseJson;
  //   try {
  //     String json_data = jsonEncode(request.toJson());
  //
  //     final apiService = DioUtil(BaseUrl);
  //     Response dioResponse = await apiService.post(
  //         "api/examination/submitstudentexamination/format/json/",
  //         json_data,
  //         authToken);
  //
  //     final httpResponseBody = dioResponse.toString();
  //     final httpResponse =
  //         http.Response(httpResponseBody, dioResponse.statusCode ?? 403);
  //
  //     responseJson = returnResponse(httpResponse);
  //   } on SocketException {
  //     throw FetchDataException('No Internet Connection');
  //   }
  //   return responseJson;
  // }

  @override
  Future getExamListResultStudent(String BaseUrl, String authToken,
      String logintype, String studentid, String resultstatus) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'logintype': logintype,
        'studentid': studentid,
        'resultstatus': resultstatus,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/examination/studentpublishedlist/format/json/",
          formData,
          authToken);
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
  Future getGallary(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postHeader(
          "api/masterapi/getgalleryimage/format/json/", authToken);

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
  Future getLeavesTypeHolidayList(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postHeader(
          "api/leaves/listing/format/json/", authToken);

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
  Future getNotificationlist(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postHeader(
          "api/userprocess/pushnotificationlist/format/json/", authToken);

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
  Future changePass(String BaseUrl, String authToken, String oldpassword,
      String newpassword) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "oldpassword": oldpassword,
        "newpassword": newpassword
      };
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/changepassword/format/json/",
          requestBody,
          authToken);

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
  Future teacherClassList(String BaseUrl, String authToken, String boardid,
      String classid, String subjectid) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "boardid": boardid,
        "classid": classid,
        "subjectid": subjectid
      };
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/contentapi/classlist/format/json/", requestBody, authToken);

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
  Future teacherSubjectList(String BaseUrl, String authToken, String boardid,
      String classid, String subjectid) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "boardid": boardid,
        "classid": classid,
        "subjectid": subjectid
      };
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/contentapi/subjectlist/format/json/", requestBody, authToken);

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
  Future getExamListForStaff(String BaseUrl, String authToken, String logintype,
      String resultstatus) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'logintype': logintype,
        'resultstatus': resultstatus,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/examination/publishedlist/format/json/", formData, authToken);
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
  Future getExamStudentResultlistForSc(
      String BaseUrl, String authToken, String logintype, String ap_id) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'ap_id': ap_id,
        'logintype': logintype,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/examination/studentexaminationresultlistforsc/format/json/",
          formData,
          authToken);
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
  Future getExamResultDetail(String BaseUrl, String authToken, String ap_id,
      String logintype, String studentid) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "ap_id": ap_id,
        "logintype": logintype,
        "studentid": studentid,
      };
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/examination/studentexamresultdeatils/format/json/",
          requestBody,
          authToken);
      final httpResponseBody = dioResponse.toString();
      Map<String, dynamic> jsonData = json.decode(httpResponseBody);

      // final httpResponse = http.Response(httpResponseBody,dioResponse.statusCode??403);
      //
      // responseJson = returnResponse(httpResponse);
      responseJson = jsonData;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getstudentList(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postHeader(
          "api/userprocess/staffstudentlist/format/json/", authToken);

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
  Future getLessonList(String BaseUrl, String authToken, String contentid,
      String chapterid) async {
    dynamic responseJson;
    try {
      final requestBody = {
        "contentid": contentid,
        "chapterid": chapterid,
      };

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/contentapi/viewchaptercontent/format/json/",
          requestBody,
          authToken);

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
  Future getTodayPunchdetail(
      String BaseUrl, String authToken, String logintype) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'logintype': logintype,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/attendanceapi/todaypunchdetail/format/json/",
          formData,
          authToken);
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
  Future getAttendanceList(
      String BaseUrl, String authToken, String logintype) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'logintype': logintype,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/attendanceapi/punchdetail/format/json/", formData, authToken);
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
  Future getTodayPunchin(
      String BaseUrl, String authToken, String logintype) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'logintype': logintype,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/attendanceapi/todaypunchin/format/json/", formData, authToken);
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
  Future getTodayPunchout(
      String BaseUrl, String authToken, String logintype) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'logintype': logintype,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/attendanceapi/todaypunchout/format/json/", formData, authToken);
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
  Future teacherClass(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postHeader(
          "api/userprocess/getclasslist/format/json/", authToken);

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
  Future getstudentListAttend(
      String BaseUrl, String authToken, String classId, String date) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'classId': classId,
        'date': date,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/getstudentlist/format/json/", formData, authToken);
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
  Future stdAttendance(String BaseUrl, String authToken, String classid,
      String attendancedate, String attendanceDetail) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'classid': classid,
        'attendancedate': attendancedate,
        'attendanceDetail': attendanceDetail,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/studentattendance/format/json/",
          formData,
          authToken);

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
  Future getQuize(String BaseUrl, String authToken, String chapterid) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'chapterid': chapterid,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/contentapi/practicequizquestion/format/json",
          formData,
          authToken);

      final httpResponseBody = dioResponse.toString();
      Map<String, dynamic> jsonData = json.decode(httpResponseBody);

      //final httpResponse = http.Response(jsonData,dioResponse.statusCode??403);

      //responseJson = returnResponse(httpResponse);
      responseJson = jsonData;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future myProfile(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postHeader(
          "api/userprocess/myprofile/format/json/", authToken);

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
  Future uploadProfilePicture(
    String BaseUrl,
    String authToken,
    String usertype,
    File fileToUpload,
  ) async {
    dynamic responseJson;

    try {
      FormData formData = FormData.fromMap({
        'usertype': usertype,
        'uploadfile': await MultipartFile.fromFile(
          fileToUpload.path,
          filename: fileToUpload.uri.pathSegments.last,
        ),
      });

      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/uploadprofilepic/format/json/", formData, authToken);

      final httpResponseBody = dioResponse.toString();
      final httpResponse =
          http.Response(httpResponseBody, dioResponse.statusCode ?? 403);

      responseJson = returnResponse(httpResponse);
    } catch (e) {
      throw e;
    }
    return responseJson;
  }

  @override
  Future getAllInterest(
      String BaseUrl, String authToken, String studentid) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'studentid': studentid,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/interestselection/format/json/",
          formData,
          authToken);

      final httpResponseBody = dioResponse.toString();
      Map<String, dynamic> jsonData = json.decode(httpResponseBody);

      //final httpResponse = http.Response(jsonData,dioResponse.statusCode??403);

      //responseJson = returnResponse(httpResponse);
      responseJson = jsonData;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getInsertInterest(
      String BaseUrl, String authToken, String Param2, String Param3) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'Param2': Param2,
        'Param3': Param3,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/insertstudentinterest/format/json/",
          formData,
          authToken);

      final httpResponseBody = dioResponse.toString();
      Map<String, dynamic> jsonData = json.decode(httpResponseBody);

      //final httpResponse = http.Response(jsonData,dioResponse.statusCode??403);

      //responseJson = returnResponse(httpResponse);
      responseJson = jsonData;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getStudentAttendance(
      String BaseUrl,
      String authToken,
      String logintype,
      String studentid,
      String attendancetype,
      String fromdate,
      String todate) async {
    dynamic responseJson;
    try {
      final formData = FormData.fromMap({
        'logintype': logintype,
        'studentid': studentid,
        'attendancetype': attendancetype,
        'fromdate': fromdate,
        'todate': todate,
      });
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.post(
          "api/userprocess/attendancelist/format/json/", formData, authToken);
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
  Future getChildInfo(String BaseUrl, String authToken) async {
    dynamic responseJson;
    try {
      final apiService = DioUtil(BaseUrl);
      Response dioResponse = await apiService.postHeader(
          "api/userprocess/childlist/format/json/", authToken);

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
