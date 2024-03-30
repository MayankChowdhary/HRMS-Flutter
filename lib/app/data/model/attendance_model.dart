/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/

class AttendanceCount {
  int? presentCount;
  int? lateCount;
  int? halfDayCount;
  int? absentCount;
  int? leaveCount;
  int? daysInMonth;
  int? workingDays;
  String? workedInMonth;
  int? totalWorkHourInMonth;

  AttendanceCount({this.presentCount, this.lateCount, this.halfDayCount, this.absentCount, this.daysInMonth, this.workingDays, this.workedInMonth, this.totalWorkHourInMonth, this.leaveCount});

  AttendanceCount.fromJson(Map<String, dynamic> json) {
    presentCount = json['presentCount'];
    lateCount = json['lateCount'];
    halfDayCount = json['halfDayCount'];
    absentCount = json['absentCount'];
    leaveCount = json['leaveCount'];
    daysInMonth = json['daysInMonth'];
    workingDays = json['workingDays'];
    workedInMonth = json['workedInMonth'];
    totalWorkHourInMonth = json['totalWorkHourInMonth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['presentCount'] = presentCount;
    data['lateCount'] = lateCount;
    data['halfDayCount'] = halfDayCount;
    data['absentCount'] = absentCount;
    data['leaveCount'] = leaveCount;
    data['daysInMonth'] = daysInMonth;
    data['workingDays'] = workingDays;
    data['workedInMonth'] = workedInMonth;
    data['totalWorkHourInMonth'] = totalWorkHourInMonth;
    return data;
  }
}

class Attendance {
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
  String? currentaddress;
  String? coordinate;
  String? comments;
  String? createdat;
  String? updatedat;

  Attendance({this.id, this.userid, this.email, this.year, this.month, this.attdate, this.attday, this.attstatus, this.holiday, this.intime, this.outtime, this.totalhours, this.islate, this.currentaddress, this.coordinate, this.comments, this.createdat, this.updatedat});

  Attendance.fromJson(Map<String, dynamic> json) {
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
    currentaddress = json['current_address'];
    coordinate = json['coordinate'];
    comments = json['comments'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['current_address'] = currentaddress;
    data['coordinate'] = coordinate;
    data['comments'] = comments;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class AttendanceModel {
  bool? success;
  int? statuscode;
  List<Attendance?>? data;
  AttendanceCount? attendanceCount;
  String? message;

  AttendanceModel({this.success, this.statuscode, this.data, this.attendanceCount, this.message});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statuscode = json['status_code'];
    if (json['data'] != null) {
      data = <Attendance>[];
      json['data'].forEach((v) {
        data!.add(Attendance.fromJson(v));
      });
    }
    attendanceCount = json['attendanceCount'] != null ? AttendanceCount?.fromJson(json['attendanceCount']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statuscode;
    data['data'] = this.data != null ? this.data!.map((v) => v?.toJson()).toList() : null;
    data['attendanceCount'] = attendanceCount!.toJson();
    data['message'] = message;
    return data;
  }
}
