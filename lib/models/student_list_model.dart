class StudentListModel {
  String? id;
  String? firstName;
  String? secondName;
  String? thirdName;
  String? forthName;
  String? family;
  String? stage;
  String? division;
  String? college;
  String? department;
  String? createdAt;
  String? updatedAt;
  bool? isAttende;
  int? v;

  StudentListModel({
    this.id,
    this.firstName,
    this.secondName,
    this.thirdName,
    this.forthName,
    this.family,
    this.stage,
    this.division,
    this.college,
    this.department,
    this.createdAt,
    this.updatedAt,
    this.isAttende = false,
    this.v,
  });

  factory StudentListModel.fromJson(Map<String, dynamic> json) {
    return StudentListModel(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      secondName: json['secondName'] as String?,
      thirdName: json['thirdName'] as String?,
      forthName: json['forthName'] as String?,
      family: json['family'] as String?,
      stage: json['stage'] as String?,
      division: json['division'] as String?,
      college: json['college'] as String?,
      department: json['department'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'secondName': secondName,
        'thirdName': thirdName,
        'forthName': forthName,
        'family': family,
        'stage': stage,
        'division': division,
        'college': college,
        'department': department,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'isAttende': isAttende,
        '__v': v,
      };

  StudentListModel copyWith({
    String? id,
    String? firstName,
    String? secondName,
    String? thirdName,
    String? forthName,
    String? family,
    String? stage,
    String? division,
    String? college,
    String? department,
    String? createdAt,
    String? updatedAt,
    bool? isAttende,
    int? v,
  }) {
    return StudentListModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      thirdName: thirdName ?? this.thirdName,
      forthName: forthName ?? this.forthName,
      family: family ?? this.family,
      stage: stage ?? this.stage,
      division: division ?? this.division,
      college: college ?? this.college,
      department: department ?? this.department,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isAttende: isAttende ?? this.isAttende,
      v: v ?? this.v,
    );
  }
}
