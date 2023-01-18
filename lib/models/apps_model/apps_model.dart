import 'app.dart';

class AppsModel {
  int? length;
  List<App>? apps;

  AppsModel({this.length, this.apps});

  factory AppsModel.fromJson(Map<String, dynamic> json) => AppsModel(
        length: json['length'] as int?,
        apps: (json['Apps'] as List<dynamic>?)
            ?.map((e) => App.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'length': length,
        'Apps': apps?.map((e) => e.toJson()).toList(),
      };
}
