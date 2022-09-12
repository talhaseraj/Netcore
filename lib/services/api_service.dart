
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:netcore/urls.dart';


class ApiService{
  static var client = http.Client;
  static Future fetchUserWallet() async {
    var response = await http.get(Uri.parse(apiUrl));
    if (kDebugMode) {
      print("User wallet print : $apiUrl");
      print("User wallet service RESPONSE : ${response.body}");
    }
    if (response.statusCode == 200) {
      var jsonString = response.body;
      if (kDebugMode) {
        print("User wallet service********");
      }
      return userWalletFromJson(jsonString);
    } else {
      if (kDebugMode) {
        print("error");
      }
      debugPrint("error accor in User wallet service********");
      return null;
    }
  }
}