class News {
  String? id;
  String? title;
  String? description;
  String? sender;
  String? cover;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  News({
    this.id,
    this.title,
    this.description,
    this.cover,
    this.sender,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        sender: json['sender'] as String?,
        cover: json['cover'] as String?,
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
        'cover': cover,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
