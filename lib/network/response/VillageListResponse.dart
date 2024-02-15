

class VillageListResponse {
  Response? response;

  VillageListResponse({this.response});

  VillageListResponse.fromJson(Map<String, dynamic> json) {
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
  List<VillageResult>? dataResult=[];
  String? message;
  bool? status;

  Response({this.dataResult, this.message, this.status});


  Response.fromJson(Map<String, dynamic> json) {
    if (json['data_result'] != null)
    {
      json['data_result'].forEach((v) {
        dataResult!.add(new VillageResult.fromJson(v));
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

class VillageResult {


  String? VillageCode;
  String? VillageName;


  VillageResult({this.VillageCode, this.VillageName});

  VillageResult.fromJson(Map<String, dynamic> json) {
    VillageCode = json['VillageCode'];
    VillageName = json['VillageName'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VillageCode'] = this.VillageCode;
    data['VillageName'] = this.VillageName;

    return data;
  }
}
