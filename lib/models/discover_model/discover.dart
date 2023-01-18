class Discover {
  String? id;
  String? title;
  String? description;
  String? cover;
  String? sender;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Discover({
    this.id,
    this.title,
    this.description,
    this.cover,
    this.sender,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Discover.fromJson(Map<String, dynamic> json) => Discover(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        cover: json['cover'] as String?,
        sender: json['sender'] as String?,
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
        'cover': cover,
        'sender': sender,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
