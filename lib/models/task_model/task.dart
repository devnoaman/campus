class Task {
  String? id;
  String? user;
  String? title;
  String? location;
  String? startTime;
  String? endTime;
  String? day;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Task({
    this.id,
    this.user,
    this.title,
    this.location,
    this.startTime,
    this.endTime,
    this.day,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['_id'] as String?,
        user: json['user'] as String?,
        title: json['title'] as String?,
        location: json['location'] as String?,
        startTime: json['startTime'] as String?,
        endTime: json['endTime'] as String?,
        day: json['day'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user,
        'title': title,
        'location': location,
        'startTime': startTime,
        'endTime': endTime,
        'day': day,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
