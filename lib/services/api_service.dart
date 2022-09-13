
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:netcore/models/api_model.dart';
import 'package:netcore/urls.dart';
import 'dart:convert' show utf8;

class ApiService{
   var client = http.Client;
   Future fetchLanguages() async {
     try {
       var response =  await http.get(Uri.parse(apiUrl));
       print(response.body);
       var temp=utf8.decode(response.bodyBytes);c
       return apiResponseFromJson(temp);
     } catch (error, stacktrace) {
       print("Exception occured: $error stackTrace: $stacktrace");
       return ApiResponseModel();
     }
   }
}