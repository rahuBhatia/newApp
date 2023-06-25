import 'package:flutter/material.dart';

import '../services/api/api_services.dart';

class AuthModel with ChangeNotifier {
  update(AuthModel auth) {}
  String userName = '';
  String userPassword = '';

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
      var result = await ApiService().requestAuth(userName , userPass);
      print(result);
    } else {
      print('Not ok');
    }
  }
}
