// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

List<ApiResponseModel> apiResponseFromJson(String str) => List<ApiResponseModel>.from(json.decode(str).map((x) => ApiResponseModel.fromJson(x)));

String apiResponseToJson(List<ApiResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiResponseModel {
  ApiResponseModel({
    this.languages,
  });

  List<Language>? languages;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) => ApiResponseModel(
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

  dynamic data;
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
