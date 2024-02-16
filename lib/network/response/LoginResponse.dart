

class LoginResponse {
  Response? response;

  LoginResponse({this.response});

  LoginResponse.fromJson(Map<String, dynamic> json) {
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
  List<DataResult>? dataResult=[];
  String? message;
  bool? status;

  Response({this.dataResult, this.message, this.status});


  Response.fromJson(Map<String, dynamic> json) {
    if (json['data_result'] != null)
    {
      json['data_result'].forEach((v) {
        dataResult!.add(new DataResult.fromJson(v));
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

class DataResult {
  String? Name;
  String? state;
  String? stateCode;
  String? district;
  String? districtCode;


  DataResult({this.Name,this.state, this.stateCode, this.district, this.districtCode});

  DataResult.fromJson(Map<String, dynamic> json) {
    Name = json['Name'];
    state = json['State'];
    stateCode = json['StateCode'];
    district = json['District'];
    districtCode = json['DistrictCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.Name;
    data['State'] = this.state;
    data['StateCode'] = this.stateCode;
    data['District'] = this.district;
    data['DistrictCode'] = this.districtCode;
    return data;
  }
}
