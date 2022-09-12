// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

List<ApiResponse> apiResponseFromJson(String str) => List<ApiResponse>.from(json.decode(str).map((x) => ApiResponse.fromJson(x)));

String apiResponseToJson(List<ApiResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiResponse {
  ApiResponse({
    this.languages,
  });

  List<Language>? languages;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "languages": List<dynamic>.from(languages!.map((x) => x.toJson())),
  };
}

class Language {
  Language({
    this.data,
    this.local,
    this.flag,
  });

  String? data;
  String? local;
  String? flag;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    data: json["data"],
    local: json["local"],
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "local": local,
    "flag": flag,
  };
}
