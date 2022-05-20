import 'package:equatable/equatable.dart';

class Stage extends Equatable {
  final String? title;

  const Stage({this.title});

  factory Stage.fromJson(Map<String, dynamic> json) => Stage(
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
