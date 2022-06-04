class Event {
  String? id;
  String? user;
  String? summary;
  String? description;
  String? location;
  String? startTime;
  String? endTime;
  bool? isAllDay;
  bool? isMultiDay;
  bool? isDone;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Event({
    this.id,
    this.user,
    this.summary,
    this.description,
    this.location,
    this.startTime,
    this.endTime,
    this.isAllDay,
    this.isMultiDay,
    this.isDone,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json['_id'] as String?,
        user: json['user'] as String?,
        summary: json['summary'] as String?,
        description: json['description'] as String?,
        location: json['location'] as String?,
        startTime: json['startTime'] as String?,
        endTime: json['endTime'] as String?,
        isAllDay: json['isAllDay'] as bool?,
        isMultiDay: json['isMultiDay'] as bool?,
        isDone: json['isDone'] as bool?,
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
        'summary': summary,
        'description': description,
        'location': location,
        'startTime': startTime,
        'endTime': endTime,
        'isAllDay': isAllDay,
        'isMultiDay': isMultiDay,
        'isDone': isDone,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
