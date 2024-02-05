
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';



abstract class BaseApiService {

  final String baseUrl = "";


  final String assesment_end = "api/userprocess/assignmentdetails/format/json/";

  Future<dynamic> getResponse(String url);


  Future<dynamic> getGetAssesment(String authtoken,String BaseUrl,String articleId);

  Future<dynamic> uploadFile(String BaseUrl, String authToken,
      String publishId,File file);

  Future<dynamic> savePlayerPosition(String BaseUrl, String authToken,
      String v_id,String seek_position);

  Future<dynamic> getVideoList(String BaseUrl, String authToken);
  Future<dynamic> getschoolCode(String BaseUrl, String SchoolCode,BuildContext context);


  Future<dynamic> getUserLogin(String BaseUrl, String username,String password,
      String deviceid,String devicetype,String logintype,String deviceToken);


  Future<dynamic> getAllSubjectList(String BaseUrl, String authToken,String boardid,String classid);

  Future<dynamic> teacherBoardList(String BaseUrl, String authToken);

  Future<dynamic> getContentList(String BaseUrl, String authToken,
      String boardid,String classid,String subjectid,String chapterid);

  Future<dynamic> getContentDetails(String BaseUrl, String authToken,
      String contentid,String chapterid);

  Future<dynamic> assignPublishStudentList(String BaseUrl, String authToken,
      String logintype,String aststus,String childid);

  Future<dynamic> getUpcomingHomework(String BaseUrl, String authToken);

  Future<dynamic> getMyProfile(String BaseUrl, String authToken);

  Future<dynamic> gettimeTable(String BaseUrl, String authToken,String studentid,String usertype);
  Future<dynamic> getVimeoDataApi(String videoVimeoId);

  Future<dynamic> getPublishAssignmentList(String BaseUrl, String authToken,String usertype);


  Future<dynamic> getverifiedAssignList(String BaseUrl, String authToken,String usertype,String ap_id);

  Future<dynamic> assignStudentSubmitCheckList(String BaseUrl, String authToken,String usertype,String aststus);

  Future<dynamic> totalPublishStudentList(String BaseUrl, String authToken,String usertype,String ap_id);
  Future<dynamic> assignDetail(String BaseUrl, String authToken,String ap_id);

  Future<dynamic> verifiedStudentList(String BaseUrl, String authToken,String ap_id,String boardId,String classId);

  // VerifiedAssignementResponse
  Future<dynamic> getVerifiedPublish(String BaseUrl, String authToken,String usertype,String a_id,String lastsdate,String a_student);
  Future<dynamic> unCheckedAssignDetailforgrade(String BaseUrl, String authToken, String publishid );

  Future<dynamic> checkedAssignment(String BaseUrl, String authToken, String publishid,String grade );


  Future<dynamic> getAsesessListForStudent(String BaseUrl, String authToken);



  Future<dynamic> getAsesessInformation(String BaseUrl, String authToken,String ap_id);




  Future<dynamic> getAssessQuestionForStudent(String BaseUrl, String authToken, String type,
      String ap_id, String selectquestionstatus, String questioncount_id);


  // Future<dynamic> submitAsesessQuestion(String BaseUrl, String authToken, SubmitAssessQuestionRequest request);
  //
  // Future<dynamic> getSubmitAssessQuestion(String BaseUrl, String authToken, SubmitAssessQuestionRequest request);

  Future<dynamic> getAssessResultList(String BaseUrl, String authToken, String logintype,String studentid);

  Future<dynamic> getAssessResultDetail(String BaseUrl, String authToken, String ap_id,String logintype,String studentid);

  Future<dynamic> getAssessResultlistForSc(String BaseUrl, String authToken, String logintype);

  Future<dynamic> getPublishAssessResult(String BaseUrl, String authToken, String ap_id);

  Future<dynamic> getAssessStudentResultlistForSc(String BaseUrl, String authToken,String logintype, String ap_id);

  Future<dynamic> getAssessmentDetail(String BaseUrl, String authToken,String a_id);

  Future<dynamic> getExamListForStudent(String BaseUrl, String authToken,String logintype,String studentid,String resultstatus);

  Future<dynamic> getExamInformationForStudent(String BaseUrl, String authToken,String ap_id);
  Future<dynamic> getExamQuestion(String BaseUrl, String authToken, String type,
      String ap_id, String selectquestionstatus, String questioncount_id);
  //
  // Future<dynamic> submitExamQuestion(String BaseUrl, String authToken, SubmitAssessQuestionRequest request);


  Future<dynamic> getExamListResultStudent(String BaseUrl, String authToken,String logintype,String studentid,String resultstatus);

  Future<dynamic> getGallary(String BaseUrl, String authToken);

  Future<dynamic> getLeavesTypeHolidayList(String BaseUrl, String authToken);
  Future<dynamic> getNotificationlist(String BaseUrl, String authToken);


  Future<dynamic> changePass(String BaseUrl, String authToken,String oldpassword,String newpassword);

  Future<dynamic> teacherClassList(String BaseUrl, String authToken,
      String boardid,String classid,String subjectid);

  Future<dynamic> teacherSubjectList(String BaseUrl, String authToken,
      String boardid,String classid,String subjectid);
  Future<dynamic> getExamListForStaff(String BaseUrl, String authToken,String logintype,String resultstatus);
  Future<dynamic> getExamStudentResultlistForSc(String BaseUrl, String authToken,String logintype, String ap_id);
  Future<dynamic> getExamResultDetail(String BaseUrl, String authToken, String ap_id,String logintype,String studentid);
  Future<dynamic> getstudentList(String BaseUrl, String authToken);

  Future<dynamic> getLessonList(String BaseUrl, String authToken,String contentid,String chapterid);

  Future<dynamic> getTodayPunchdetail(String BaseUrl, String authToken,String logintype);
  Future<dynamic> getAttendanceList(String BaseUrl, String authToken,String logintype);

  Future<dynamic> getTodayPunchin(String BaseUrl, String authToken,String logintype);
  Future<dynamic> getTodayPunchout(String BaseUrl, String authToken,String logintype);

  Future<dynamic> teacherClass(String BaseUrl, String authToken);

  Future<dynamic> getstudentListAttend(String BaseUrl, String authToken,String classId,String date);

  Future<dynamic> stdAttendance(String BaseUrl, String authToken,String classid,String attendancedate,String attendanceDetail);


  Future<dynamic> getQuize(String BaseUrl, String authToken, String chapterid);

  Future<dynamic> myProfile(String BaseUrl, String authToken);


  Future<dynamic> uploadProfilePicture(String BaseUrl, String authToken,
      String usertype,File file);

  Future<dynamic> getAllInterest(String BaseUrl, String authToken,String studentid);

  Future<dynamic> getInsertInterest(String BaseUrl, String authToken,String Param2,String Param3);


  Future<dynamic> getStudentAttendance(String BaseUrl, String authToken, String logintype,String studentid,
      String attendancetype,String fromdate,String todate);

  Future<dynamic> getChildInfo(String BaseUrl, String authToken);

}