import 'package:equatable/equatable.dart';

class College extends Equatable {
  final String? title;

  const College({this.title});

  factory College.fromJson(Map<String, dynamic> json) => College(
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
