import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> requestAuth(userName, password) async {
    dynamic returnData;
    var url = Uri.parse('https://invoice.auramatics.com/api/login');
    Map dataToSend = {"user_name": userName, "password": password};
    dynamic response;
    try {
      response = await http.post(url,
          body: jsonEncode(dataToSend),
          headers: {"content-type": "application/json"});
      print(jsonDecode(response.body));
      returnData = jsonDecode(response.body);
    } catch (e) {
      returnData = false;
    }
    return returnData;
  }

  Future<dynamic> requestHomeScreenData({floor, searchText}) async {
    dynamic returnData;
    String link = 'https://invoice.auramatics.com/api/customer';
    if (floor == null && searchText == null) {
      link = 'https://invoice.auramatics.com/api/customer';
    } else if (floor != '0' && floor != '' && searchText != '') {
      link =
          'https://invoice.auramatics.com/api/customer?q=${searchText}&floor=${floor}';
    } else if (floor != '0' && floor != '') {
      link = 'https://invoice.auramatics.com/api/customer?floor=${floor}';
    } else if (searchText != '') {
      link = 'https://invoice.auramatics.com/api/customer?q=${searchText}';
    }
    print(link);
    var url = Uri.parse(link);
    dynamic response;
    try {
      response =
          await http.get(url, headers: {"content-type": "application/json"});
      print(jsonDecode(response.body));
      returnData = jsonDecode(response.body);
    } catch (e) {
      returnData = false;
    }
    return returnData;
  }

  Future<dynamic> requestHomeScreenFloorData() async {
    dynamic returnData;
    var url = Uri.parse('https://invoice.auramatics.com/api/floor');
    dynamic response;
    try {
      response =
          await http.get(url, headers: {"content-type": "application/json"});
      print(jsonDecode(response.body));
      returnData = jsonDecode(response.body);
    } catch (e) {
      returnData = false;
    }
    return returnData;
  }

  Future<dynamic> drawerTaskList() async {
    dynamic returnData;
    var url = Uri.parse('https://invoice.auramatics.com/api/job-task');
    dynamic response;
    try {
      response =
          await http.get(url, headers: {"content-type": "application/json"});
      print(jsonDecode(response.body));
      returnData = jsonDecode(response.body);
    } catch (e) {
      returnData = false;
    }
    return returnData;
  }
}
