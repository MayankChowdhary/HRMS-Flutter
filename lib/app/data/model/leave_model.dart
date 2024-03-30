class Leave {
  int? id;
  String? userid;
  String? email;
  String? totalleave;
  String? balleave;
  String? createdat;
  String? updatedat;

  Leave({this.id, this.userid, this.email, this.totalleave, this.balleave, this.createdat, this.updatedat});

  Leave.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    email = json['email'];
    totalleave = json['total_leave'];
    balleave = json['bal_leave'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['userid'] = userid;
    data['email'] = email;
    data['total_leave'] = totalleave;
    data['bal_leave'] = balleave;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class LeaveModel {
  bool? success;
  int? statuscode;
  List<Leave?>? data;
  String? message;

  LeaveModel({this.success, this.statuscode, this.data, this.message});

  LeaveModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statuscode = json['status_code'];
    if (json['data'] != null) {
      data = <Leave>[];
      json['data'].forEach((v) {
        data!.add(Leave.fromJson(v));
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

