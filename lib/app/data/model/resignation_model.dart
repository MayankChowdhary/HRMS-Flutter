/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Resignation {
  int? id;
  String? userid;
  String? email;
  String? applieddate;
  String? resigndate;
  String? reason;
  String? status;
  String? label;
  String? createdat;
  String? updatedat;

  Resignation({this.id, this.userid, this.email, this.applieddate, this.resigndate, this.reason, this.status, this.label, this.createdat, this.updatedat});

  Resignation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    email = json['email'];
    applieddate = json['applied_date'];
    resigndate = json['resign_date'];
    reason = json['reason'];
    status = json['status'];
    label = json['label'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['userid'] = userid;
    data['email'] = email;
    data['applied_date'] = applieddate;
    data['resign_date'] = resigndate;
    data['reason'] = reason;
    data['status'] = status;
    data['label'] = label;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class ResignationRoot {
  bool? success;
  int? statuscode;
  List<Resignation?>? data;
  String? message;

  ResignationRoot({this.success, this.statuscode, this.data, this.message});

  ResignationRoot.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statuscode = json['status_code'];
    if (json['data'] != null) {
      data = <Resignation>[];
      json['data'].forEach((v) {
        data!.add(Resignation.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statuscode;
    data['data'] = this.data != null ? this.data!.map((v) => v?.toJson()).toList() : null;
    data['message'] = message;
    return data;
  }
}

