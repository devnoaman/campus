class Add {
  String? id;
  String? description;
  String? cover;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Add({
    this.id,
    this.description,
    this.cover,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Add.fromJson(Map<String, dynamic> json) => Add(
        id: json['_id'] as String?,
        description: json['description'] as String?,
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
        'description': description,
        'cover': cover,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
