/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class BankDetail {
  int? id;
  String? userid;
  String? bankname;
  String? accountno;
  String? ifsccode;
  String? branchname;
  String? bankaddress;
  String? pancard;
  String? aadharcard;
  String? createdat;
  String? updatedat;

  BankDetail({this.id, this.userid, this.bankname, this.accountno, this.ifsccode, this.branchname, this.bankaddress, this.pancard, this.aadharcard, this.createdat, this.updatedat});

  BankDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    bankname = json['bank_name'];
    accountno = json['account_no'];
    ifsccode = json['ifsc_code'];
    branchname = json['branch_name'];
    bankaddress = json['bank_address'];
    pancard = json['pan_card'];
    aadharcard = json['aadhar_card'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['bank_name'] = bankname;
    data['account_no'] = accountno;
    data['ifsc_code'] = ifsccode;
    data['branch_name'] = branchname;
    data['bank_address'] = bankaddress;
    data['pan_card'] = pancard;
    data['aadhar_card'] = aadharcard;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class UserDetails {
  int? id;
  String? userid;
  String? firstname;
  String? lastname;
  String? email;
  String? phonenumber;
  String? emailverifiedat;
  String? status;
  String? type;
  String? worklocation;
  String? createdat;
  String? updatedat;

  UserDetails({this.id, this.userid, this.firstname, this.lastname, this.email, this.phonenumber, this.emailverifiedat, this.status, this.type, this.worklocation, this.createdat, this.updatedat});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    firstname = json['first_name'];
    lastname = json['last_name'];
    email = json['email'];
    phonenumber = json['phone_number'];
    emailverifiedat = json['email_verified_at'];
    status = json['status'];
    type = json['type'];
    worklocation = json['work_location'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['first_name'] = firstname;
    data['last_name'] = lastname;
    data['email'] = email;
    data['phone_number'] = phonenumber;
    data['email_verified_at'] = emailverifiedat;
    data['status'] = status;
    data['type'] = type;
    data['work_location'] = worklocation;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class FamilyDetail {
  int? id;
  String? userid;
  String? fathername;
  String? mothername;
  String? personalemail;
  String? alternatecontact;
  String? familyaddress;
  String? createdat;
  String? updatedat;

  FamilyDetail({this.id, this.userid, this.fathername, this.mothername, this.personalemail, this.alternatecontact, this.familyaddress, this.createdat, this.updatedat});

  FamilyDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    fathername = json['father_name'];
    mothername = json['mother_name'];
    personalemail = json['personal_email'];
    alternatecontact = json['alternate_contact'];
    familyaddress = json['family_address'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['father_name'] = fathername;
    data['mother_name'] = mothername;
    data['personal_email'] = personalemail;
    data['alternate_contact'] = alternatecontact;
    data['family_address'] = familyaddress;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class PersonalDetail {
  int? id;
  String? userid;
  String? src;
  String? mimetype;
  String? gender;
  String? dob;
  String? bio;
  String? address;
  String? address2;
  String? state;
  String? city;
  String? zipcode;
  String? country;
  String? addresstype;
  String? createdat;
  String? updatedat;

  PersonalDetail({this.id, this.userid, this.src, this.mimetype, this.gender, this.dob, this.bio, this.address, this.address2, this.state, this.city, this.zipcode, this.country, this.addresstype, this.createdat, this.updatedat});

  PersonalDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    src = json['src'];
    mimetype = json['mime_type'];
    gender = json['gender'];
    dob = json['dob'];
    bio = json['bio'];
    address = json['address'];
    address2 = json['address2'];
    state = json['state'];
    city = json['city'];
    zipcode = json['zipcode'];
    country = json['country'];
    addresstype = json['address_type'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['src'] = src;
    data['mime_type'] = mimetype;
    data['gender'] = gender;
    data['dob'] = dob;
    data['bio'] = bio;
    data['address'] = address;
    data['address2'] = address2;
    data['state'] = state;
    data['city'] = city;
    data['zipcode'] = zipcode;
    data['country'] = country;
    data['address_type'] = addresstype;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class ProfessionalDetail {
  int? id;
  String? userid;
  String? designation;
  String? experience;
  String? skills;
  String? joiningdate;
  String? terminationdate;
  String? terminationreason;
  String? createdat;
  String? updatedat;

  ProfessionalDetail({this.id, this.userid, this.designation, this.experience, this.skills, this.joiningdate, this.terminationdate, this.terminationreason, this.createdat, this.updatedat});

  ProfessionalDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    designation = json['designation'];
    experience = json['experience'];
    skills = json['skills'];
    joiningdate = json['joining_date'];
    terminationdate = json['termination_date'];
    terminationreason = json['termination_reason'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['designation'] = designation;
    data['experience'] = experience;
    data['skills'] = skills;
    data['joining_date'] = joiningdate;
    data['termination_date'] = terminationdate;
    data['termination_reason'] = terminationreason;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class UserDetailsModel {
  bool? success;
  int? statuscode;
  List<UserDetails?>? data;
  List<ProfessionalDetail?>? professionalDetails;
  List<PersonalDetail?>? personalDetails;
  List<FamilyDetail?>? familyDetails;
  List<BankDetail?>? bankDetails;
  String? message;

  UserDetailsModel({this.success, this.statuscode, this.data, this.professionalDetails, this.personalDetails, this.familyDetails, this.bankDetails, this.message});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statuscode = json['status_code'];
    if (json['data'] != null) {
      data = <UserDetails>[];
      json['data'].forEach((v) {
        data!.add(UserDetails.fromJson(v));
      });
    }
    if (json['professionalDetails'] != null) {
      professionalDetails = <ProfessionalDetail>[];
      json['professionalDetails'].forEach((v) {
        professionalDetails!.add(ProfessionalDetail.fromJson(v));
      });
    }
    if (json['personalDetails'] != null) {
      personalDetails = <PersonalDetail>[];
      json['personalDetails'].forEach((v) {
        personalDetails!.add(PersonalDetail.fromJson(v));
      });
    }
    if (json['familyDetails'] != null) {
      familyDetails = <FamilyDetail>[];
      json['familyDetails'].forEach((v) {
        familyDetails!.add(FamilyDetail.fromJson(v));
      });
    }
    if (json['bankDetails'] != null) {
      bankDetails = <BankDetail>[];
      json['bankDetails'].forEach((v) {
        bankDetails!.add(BankDetail.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statuscode;
    data['data'] = this.data != null ? this.data!.map((v) => v?.toJson()).toList() : null;
    data['professionalDetails'] =professionalDetails != null ? professionalDetails!.map((v) => v?.toJson()).toList() : null;
    data['personalDetails'] =personalDetails != null ? personalDetails!.map((v) => v?.toJson()).toList() : null;
    data['familyDetails'] =familyDetails != null ? familyDetails!.map((v) => v?.toJson()).toList() : null;
    data['bankDetails'] =bankDetails != null ? bankDetails!.map((v) => v?.toJson()).toList() : null;
    data['message'] = message;
    return data;
  }
}

