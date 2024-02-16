

class DesignationListResponse {
  Response? response;

  DesignationListResponse({this.response});

  DesignationListResponse.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  List<DesignationResult>? dataResult=[];
  String? message;
  bool? status;

  Response({this.dataResult, this.message, this.status});


  Response.fromJson(Map<String, dynamic> json) {
    if (json['data_result'] != null)
    {
      json['data_result'].forEach((v) {
        dataResult!.add(new DesignationResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataResult != null) {
      data['data_result'] = dataResult!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class DesignationResult {
  String? Designation;
  DesignationResult({this.Designation});
  DesignationResult.fromJson(Map<String, dynamic> json) {
    Designation = json['Designation'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Designation'] = this.Designation;


    return data;
  }
}
