import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final String? title;

  const Department({this.title});

  factory Department.fromJson(Map<String, dynamic> json) => Department(
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
