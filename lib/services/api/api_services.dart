import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> requestAuth(userName , password) async {
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
}
