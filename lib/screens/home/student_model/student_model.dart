import 'package:equatable/equatable.dart';

import 'college.dart';
import 'department.dart';
import 'division.dart';
import 'stage.dart';

class StudentModel extends Equatable {
  final String? firstname;
  final String? secondName;
  final String? thirdName;
  final String? forthName;
  final String? family;
  final Stage? stage;
  final Division? division;
  final Department? department;
  final College? college;
  final String? email;
  final String? phoneNumber;
  final String? userImage;
  final String? created;
  final String? updated;

  const StudentModel({
    this.firstname,
    this.secondName,
    this.thirdName,
    this.forthName,
    this.family,
    this.stage,
    this.division,
    this.department,
    this.college,
    this.email,
    this.phoneNumber,
    this.userImage,
    this.created,
    this.updated,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        firstname: json['firstname'] as String?,
        secondName: json['secondName'] as String?,
        thirdName: json['thirdName'] as String?,
        forthName: json['forthName'] as String?,
        family: json['family'] as String?,
        stage: json['stage'] == null
            ? null
            : Stage.fromJson(json['stage'] as Map<String, dynamic>),
        division: json['division'] == null
            ? null
            : Division.fromJson(json['division'] as Map<String, dynamic>),
        department: json['department'] == null
            ? null
            : Department.fromJson(json['department'] as Map<String, dynamic>),
        college: json['college'] == null
            ? null
            : College.fromJson(json['college'] as Map<String, dynamic>),
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        userImage: json['userImage'] as String?,
        created: json['created'] as String?,
        updated: json['updated'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'secondName': secondName,
        'thirdName': thirdName,
        'forthName': forthName,
        'family': family,
        'stage': stage?.toJson(),
        'division': division?.toJson(),
        'department': department?.toJson(),
        'college': college?.toJson(),
        'email': email,
        'phoneNumber': phoneNumber,
        'userImage': userImage,
        'created': created,
        'updated': updated,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      firstname,
      secondName,
      thirdName,
      forthName,
      family,
      stage,
      division,
      department,
      college,
      email,
      phoneNumber,
      userImage,
      created,
      updated,
    ];
  }
}
