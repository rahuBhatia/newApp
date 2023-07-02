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
  var homeScreenFloorData = [];
  bool homeLoder = true;
 
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
        return result;
      } else {
        print("hi i am rr --- $result");
        return result;
      }
    } else {
      print('Not ok');
      return false;
    }
  }
  refrestHomeData(){
    homeLoder = true;
    homeData = [];
    notifyListeners();
  }
  getHomeScreenData({floor , searchText}) async {
    //homeData = [];
   // notifyListeners();
    var returnData = [];
    var result = await ApiService().requestHomeScreenData(floor : floor , searchText : searchText);
    print("home result ---$result");
    if (result != null &&
        result['success'] == true &&
        result['data'].length > 0) {
      returnData = result['data'];
    } 
    homeData = returnData;
    homeLoder = false;
    notifyListeners();
  }
  getHomeScreenFloorData() async {
    var returnData = [];
    var result = await ApiService().requestHomeScreenFloorData();
    print("home result ---$result");
    if (result != null &&
        result['success'] == true &&
        result['data'].length > 0) {
      returnData = result['data'];
    } 
    homeScreenFloorData = returnData;
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
