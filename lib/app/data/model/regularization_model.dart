/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Regularization {
  int? id;
  String? userid;
  String? attid;
  String? email;
  String? attdate;
  String? reason;
  String? status;
  String? createdat;
  String? updatedat;

  Regularization(
      {this.id,
      this.userid,
      this.attid,
      this.email,
      this.attdate,
      this.reason,
      this.status,
      this.createdat,
      this.updatedat});

  Regularization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    attid = json['att_id'];
    email = json['email'];
    attdate = json['att_date'];
    reason = json['reason'];
    status = json['status'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['att_id'] = attid;
    data['email'] = email;
    data['att_date'] = attdate;
    data['reason'] = reason;
    data['status'] = status;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class RegularizationRoot {
  bool? success;
  int? statuscode;
  List<Regularization?>? data;
  String? message;

  RegularizationRoot({this.success, this.statuscode, this.data, this.message});

  RegularizationRoot.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statuscode = json['status_code'];
    if (json['data'] != null) {
      data = <Regularization>[];
      json['data'].forEach((v) {
        data!.add(Regularization.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statuscode;
    data['data'] =
        this.data != null ? this.data!.map((v) => v?.toJson()).toList() : null;
    data['message'] = message;
    return data;
  }
}
