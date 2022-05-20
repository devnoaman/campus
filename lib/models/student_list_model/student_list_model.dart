import 'college.dart';
import 'department.dart';
import 'division.dart';
import 'stage.dart';

class StudentListModel {
  String? firstname;
  String? secondName;
  String? thirdName;
  String? forthName;
  String? family;
  bool? isAtende;
  Stage? stage;
  Division? division;
  Department? department;
  College? college;
  String? email;
  String? phoneNumber;
  String? userImage;
  String? created;
  String? updated;

  StudentListModel({
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
    this.isAtende,
    this.userImage,
    this.created,
    this.updated,
  });

  factory StudentListModel.fromJson(Map<String, dynamic> json) {
    return StudentListModel(
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
  }

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
        'isAtende': isAtende,
      };

  StudentListModel copyWith(
      {String? firstname,
      String? secondName,
      String? thirdName,
      String? forthName,
      String? family,
      Stage? stage,
      Division? division,
      Department? department,
      College? college,
      String? email,
      String? phoneNumber,
      String? userImage,
      String? created,
      String? updated,
      bool? isAtende}) {
    return StudentListModel(
        firstname: firstname ?? this.firstname,
        secondName: secondName ?? this.secondName,
        thirdName: thirdName ?? this.thirdName,
        forthName: forthName ?? this.forthName,
        family: family ?? this.family,
        stage: stage ?? this.stage,
        division: division ?? this.division,
        department: department ?? this.department,
        college: college ?? this.college,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        userImage: userImage ?? this.userImage,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        isAtende: isAtende ?? this.isAtende);
  }
}
