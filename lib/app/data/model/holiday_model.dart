/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Holiday {
  int? id;
  String? holidaydate;
  String? holidayname;
  String? month;
  String? year;
  String? createdat;
  String? updatedat;

  Holiday({this.id, this.holidaydate, this.holidayname, this.month, this.year, this.createdat, this.updatedat});

  Holiday.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    holidaydate = json['holiday_date'];
    holidayname = json['holiday_name'];
    month = json['month'];
    year = json['year'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['holiday_date'] = holidaydate;
    data['holiday_name'] = holidayname;
    data['month'] = month;
    data['year'] = year;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class HolidayRoot {
  bool? success;
  int? statuscode;
  List<Holiday?>? data;
  String? message;

  HolidayRoot({this.success, this.statuscode, this.data, this.message});

  HolidayRoot.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statuscode = json['status_code'];
    if (json['data'] != null) {
      data = <Holiday>[];
      json['data'].forEach((v) {
        data!.add(Holiday.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['status_code'] = statuscode;
    data['data'] =data != null ? this.data!.map((v) => v?.toJson()).toList() : null;
    data['message'] = message;
    return data;
  }
}


