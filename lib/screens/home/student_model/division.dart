import 'package:equatable/equatable.dart';

class Division extends Equatable {
  final String? title;

  const Division({this.title});

  factory Division.fromJson(Map<String, dynamic> json) => Division(
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [title];
}
