// ignore_for_file: deprecated_member_use

import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';

@JsonSerializable(nullable: false)
class Article {
  Article();

  @JsonKey(name: 'author')
  String? author;

  @JsonKey(name: 'description')
  String? desc;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'urlToImage')
  String? imageUrl;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'content')
  String? content;

  @JsonKey(name: 'publishedAt')
  String? publishedAt;

  DateTime get getPublishedAtDate {
    return DateTime.parse(publishedAt!);
  }

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
