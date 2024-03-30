/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class AttendanceStatus {
  int? id;
  String? userid;
  String? email;
  String? year;
  String? month;
  String? attdate;
  String? attday;
  String? attstatus;
  String? holiday;
  String? intime;
  String? outtime;
  String? totalhours;
  String? islate;
  String? comments;
  String? createdat;
  String? updatedat;

  AttendanceStatus(
      {this.id,
      this.userid,
      this.email,
      this.year,
      this.month,
      this.attdate,
      this.attday,
      this.attstatus,
      this.holiday,
      this.intime,
      this.outtime,
      this.totalhours,
      this.islate,
      this.comments,
      this.createdat,
      this.updatedat});

  AttendanceStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    email = json['email'];
    year = json['year'];
    month = json['month'];
    attdate = json['att_date'];
    attday = json['att_day'];
    attstatus = json['att_status'];
    holiday = json['holiday'];
    intime = json['in_time'];
    outtime = json['out_time'];
    totalhours = json['total_hours'];
    islate = json['is_late'];
    comments = json['comments'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['userid'] = userid;
    data['email'] = email;
    data['year'] = year;
    data['month'] = month;
    data['att_date'] = attdate;
    data['att_day'] = attday;
    data['att_status'] = attstatus;
    data['holiday'] = holiday;
    data['in_time'] = intime;
    data['out_time'] = outtime;
    data['total_hours'] = totalhours;
    data['is_late'] = islate;
    data['comments'] = comments;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class AttendanceStatusModel {
  bool? success;
  int? statuscode;
  List<AttendanceStatus?>? data;
  String? message;

  AttendanceStatusModel(
      {this.success, this.statuscode, this.data, this.message});

  AttendanceStatusModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statuscode = json['status_code'];
    if (json['data'] != null) {
      data = <AttendanceStatus>[];
      json['data'].forEach((v) {
        data!.add(AttendanceStatus.fromJson(v));
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
