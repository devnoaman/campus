class NewsModel {
  String? id;
  String? title;
  String? cover;
  String? description;
  String? sender;
  String? created;
  String? updated;

  NewsModel({
    this.id,
    this.title,
    this.cover,
    this.description,
    this.sender,
    this.created,
    this.updated,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        cover: json['cover'] as String?,
        description: json['description'] as String?,
        sender: json['sender'] as String?,
        created: json['created'] as String?,
        updated: json['updated'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'cover': cover,
        'description': description,
        'sender': sender,
        'created': created,
        'updated': updated,
      };
}
