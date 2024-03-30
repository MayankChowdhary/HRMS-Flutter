import 'package:employee_attendance_flutter/app/core/utils/constants.dart';
import 'package:get_storage/get_storage.dart';

class StorageUtils {
  StorageUtils._();

  static final StorageUtils _instance = StorageUtils._();

  static StorageUtils get instance => _instance;

  final _box = GetStorage(AppConstants.kAppName);

  void setTutorialShown(bool data) {
    _box.write(StorageKeys.isTutorialShown, data);
  }

  bool isTutorialShown() {
    return _box.read(StorageKeys.isTutorialShown) ?? false;
  }

  void setIsLoggedIn(bool data) {
    _box.write(StorageKeys.isUserLoggedIn, data);
  }

  bool isLoggedIn() {
    return _box.read(StorageKeys.isUserLoggedIn) ?? false;
  }

  void setToken(String data) {
    _box.write(StorageKeys.LoginToken, data);
  }

  String getToken() {
    return _box.read(StorageKeys.LoginToken) ?? '';
  }

  void setFullName(String data) {
    _box.write(StorageKeys.fullName, data);
  }

  String getFullNAme() {
    return _box.read(StorageKeys.fullName) ?? 'Unknown user';
  }

  void setDesignation(String data) {
    _box.write(StorageKeys.designation, data);
  }

  String getDesignation() {
    return _box.read(StorageKeys.designation) ?? "";
  }

  void setUserData(String data) {
    _box.write(StorageKeys.UserData, data);
  }

  // UserData getUserData(){
  //   return UserModel.fromJson(jsonDecode(_box.read(StorageKeys.UserData))).userData!;
  // }



  void setSubscriberId(String data) {
    _box.write(StorageKeys.SubscriberId, data);
  }

  String getSubscriberId() {
    return _box.read(StorageKeys.SubscriberId) ?? '';
  }

  void setBouqueId(String data) {
    _box.write(StorageKeys.BouqueId, data);
  }

  String getBouqueId() {
    return _box.read(StorageKeys.BouqueId) ?? '';
  }

  void setUsername(String data) {
    _box.write(StorageKeys.username, data);
  }

  String getUsername() {
    return _box.read(StorageKeys.username) ?? '';
  }

  void setProfilePic(String data) {
    _box.write(StorageKeys.profilePic, data);
  }

  String getProfilePic() {
    return _box.read(StorageKeys.profilePic) ?? '';
  }
  void setSelectedAccount(String data) {
    _box.write(StorageKeys.SelectedAcount, data);
  }

  // Accounts getSelectedAccount(){
  //   return Accounts.fromJson(jsonDecode(_box.read(StorageKeys.SelectedAcount)));
  // }

  //log out
  void clearAll() {
    _box.erase();
  }
}

class StorageKeys {
  static const String isTutorialShown = 'isTutorialShown';
  static const String isUserLoggedIn = 'isUserLoggedIn';
  static const String LoginToken = 'LoginToken';
  static const String UserData = 'UserData';
  static const String SubscriberId = 'SubscriberId';
  static const String BouqueId = 'BouqueId';
  static const String SelectedAcount = 'SelectedAccount';
  static const String username = 'username';
  static const String fullName = 'UserFullName';
  static const String designation = 'UserDesignation';
  static const String profilePic = 'ProfilePic';
}
