class StudenListModel {
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
  int? v;

  StudenListModel({
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
    this.v,
  });

  factory StudenListModel.fromJson(Map<String, dynamic> json) {
    return StudenListModel(
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
        '__v': v,
      };
}
