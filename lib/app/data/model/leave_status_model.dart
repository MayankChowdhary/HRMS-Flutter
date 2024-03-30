/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class LeaveStatus {
  int? id;
  String? userid;
  String? email;
  String? startdate;
  String? enddate;
  String? reason;
  String? status;
  String? appliedOn;
  String? createdat;
  String? updatedat;

  LeaveStatus({this.id, this.userid, this.email, this.startdate, this.enddate, this.reason, this.status, this.appliedOn, this.createdat, this.updatedat});

  LeaveStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    email = json['email'];
    startdate = json['start_date'];
    enddate = json['end_date'];
    reason = json['reason'];
    status = json['status'];
    appliedOn = json['appliedOn'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['userid'] = userid;
    data['email'] = email;
    data['start_date'] = startdate;
    data['end_date'] = enddate;
    data['reason'] = reason;
    data['status'] = status;
    data['appliedOn'] = appliedOn;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class LeaveStatusRoot {
  bool? success;
  int? statuscode;
  List<LeaveStatus?>? data;
  String? message;

  LeaveStatusRoot({this.success, this.statuscode, this.data, this.message});

  LeaveStatusRoot.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statuscode = json['status_code'];
    if (json['data'] != null) {
      data = <LeaveStatus>[];
      json['data'].forEach((v) {
        data!.add(LeaveStatus.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['status_code'] = statuscode;
    data['data'] = this.data != null ? this.data!.map((v) => v?.toJson()).toList() : null;
    data['message'] = message;
    return data;
  }
}

