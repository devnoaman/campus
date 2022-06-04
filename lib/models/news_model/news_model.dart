import 'news.dart';

class NewsModel {
  int? length;
  List<News>? news;

  NewsModel({this.length, this.news});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        length: json['length'] as int?,
        news: (json['News'] as List<dynamic>?)
            ?.map((e) => News.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'length': length,
        'News': news?.map((e) => e.toJson()).toList(),
      };
}
