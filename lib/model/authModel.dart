import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant_data.dart';
import '../services/api/api_services.dart';

class AuthModel with ChangeNotifier {
  update(AuthModel auth) {}
  String userName = '';
  String userPassword = '';
  var homeData = [];
  var drawerTaskes = [];
  getUserDetail({required String userName, required String userPass}) {
    print('hi i am in');
    if (userName.isNotEmpty) {
      userName = userName;
    } else if (userPassword.isNotEmpty) {
      userPassword = userPass;
    }
    print("---$userName");
    print("0---$userPassword");
  }

  verificationUser({required String userName, required String userPass}) async {
    print("---$userName");
    if (userName.isNotEmpty && userPass.isNotEmpty) {
      print('Let veryfy $userPassword');
      var result = await ApiService().requestAuth(userName, userPass);
      if (result != null &&
          result['success'] == true &&
          result['data']['token'] != '') {
        var token = result['data']['token'];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        print("---$token");
        return true;
      } else {
        print("hi i am rr --- $result");
        return false;
      }
    } else {
      print('Not ok');
      return false;
    }
  }

  getHomeScreenData() async {
    var returnData = [];
    var result = await ApiService().requestHomeScreenData();
    print("home result ---$result");
    if (result != null &&
        result['success'] == true &&
        result['data'].length > 0) {
      returnData = result['data'];
    } 
    homeData = returnData;
    notifyListeners();
  }
  getDrawerTaksList() async {
    var returnData = [];
    var result = await ApiService().drawerTaskList();
    print("home result ---$result");
    if (result != null &&
        result['success'] == true &&
        result['data'].length > 0) {
      returnData = result['data'];
    } 
    drawerTaskes = returnData;
    notifyListeners();
  }

  logOut() async {
     await SharedPreferencesData().removeData(SharedPreferencesData().tokenKey);
     return true;
  }
}
