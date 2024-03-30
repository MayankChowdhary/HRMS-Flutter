class APIPath {

  static const kEndPointURL = "http://banarasicraft.com";

  static const kBaseUrl = "$kEndPointURL/api/v1";

  static const kAssetLogo = "assets/images/logo/logo.png";
  static const kIDCardFrontImage = "assets/images/id_front.png";
  static const kIDCardBackImage = "assets/images/id_back.png";
  static const kIDCardQRImage = "assets/images/back_qr.png";

  static const kLogin = "$kBaseUrl/login";
  static const kProfilePicPrefix = "$kEndPointURL/storage/images/";

  static const kAttendance = "$kBaseUrl/user-attendance";
  static const kGetUser = "$kBaseUrl/get-user";
  static const kGetAttendance = "$kBaseUrl/get-attendance";
  static const kGetAttendanceChart = "$kBaseUrl/getWorkingDays";
  static const kGetOfficeLocation = "$kBaseUrl/get-office";
  static const kGetAttendanceStatus = "$kBaseUrl/getTodaysAttendance";
  static const kPostProfilePersonalData = "$kBaseUrl/edit-personal";
  static const kPostProfileProfessional = "$kBaseUrl/edit-professional";
  static const kPostProfileFamily = "$kBaseUrl/edit-family";
  static const kPostProfileBank = "$kBaseUrl/edit-bank";
  static const kPostRegularization = "$kBaseUrl/apply-regularization";
  static const kGetRegularization = "$kBaseUrl/get-regularization";
  static const kPostProfilePicture = "$kBaseUrl/edit-personal/profile-picture";
  static const kGetLeaveStatus = "$kBaseUrl/get-leave-status";
  static const kGetLeaves = "$kBaseUrl/get-leave";
  static const kApplyLeave = "$kBaseUrl/apply-leave";
  static const kPostResignation = "$kBaseUrl/create-resign";
  static const kGetResignation = "$kBaseUrl/get-resign";
  static const kGetReimbursement = "$kBaseUrl/get-reimbursement";
  static const kPostReimbursement = "$kBaseUrl/add-reimbursement";
  static const kPostToken = "$kBaseUrl/add-user-deviceToken";
  static const kGetNotifications = "$kBaseUrl/get-user-notification";
  static const kGetHolidays = "$kBaseUrl/get-holidays";




}
