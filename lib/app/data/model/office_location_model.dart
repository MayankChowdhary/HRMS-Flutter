class OfficeLocation {
  int? id;
  String? officelocation;
  String? latitude;
  String? longitude;
  String? createdat;
  String? updatedat;

  OfficeLocation(
      {this.id,
      this.officelocation,
      this.latitude,
      this.longitude,
      this.createdat,
      this.updatedat});

  OfficeLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    officelocation = json['office_location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['office_location'] = officelocation;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class OfficeLocationRoot {
  bool? success;
  int? statuscode;
  List<OfficeLocation?>? data;
  String? message;

  OfficeLocationRoot({this.success, this.statuscode, this.data, this.message});

  OfficeLocationRoot.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statuscode = json['status_code'];
    if (json['data'] != null) {
      data = <OfficeLocation>[];
      json['data'].forEach((v) {
        data!.add(OfficeLocation.fromJson(v));
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
