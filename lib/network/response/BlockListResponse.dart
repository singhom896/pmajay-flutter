

class BlockListResponse {
  Response? response;

  BlockListResponse({this.response});

  BlockListResponse.fromJson(Map<String, dynamic> json) {
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
  List<BlockResult>? dataResult=[];
  String? message;
  bool? status;

  Response({this.dataResult, this.message, this.status});


  Response.fromJson(Map<String, dynamic> json) {
    if (json['data_result'] != null)
    {
      json['data_result'].forEach((v) {
        dataResult!.add(new BlockResult.fromJson(v));
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

class BlockResult {


  String? BlockCode;
  String? BlockName;


  BlockResult({this.BlockCode, this.BlockName});

  BlockResult.fromJson(Map<String, dynamic> json) {
    BlockCode = json['BlockCode'];
    BlockName = json['BlockName'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BlockCode'] = this.BlockCode;
    data['BlockName'] = this.BlockName;

    return data;
  }
}
