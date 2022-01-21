// ignore_for_file: deprecated_member_use

import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_byusing_getx/core/model/article.dart';

part 'news_response_model.g.dart';

@JsonSerializable(nullable: false)
class NewsResponse {
  NewsResponse();
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "totalResults")
  int? totalResults;

  @JsonKey(name: "articles")
  List<Article>? articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
