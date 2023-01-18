class MyNotification {
  String? id;
  String? title;
  String? description;
  String? sender;
  String? to;
  String? link;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  MyNotification({
    this.id,
    this.title,
    this.link,
    this.description,
    this.sender,
    this.to,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MyNotification.fromJson(Map<String, dynamic> json) => MyNotification(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        sender: json['sender'] as String?,
        link: json['link'] as String?,
        to: json['to'] as String?,
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
        'title': title,
        'description': description,
        'sender': sender,
        'link': link,
        'to': to,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
