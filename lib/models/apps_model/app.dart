class App {
  String? id;
  String? title;
  String? link;
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  App({
    this.id,
    this.title,
    this.link,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory App.fromJson(Map<String, dynamic> json) => App(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        link: json['link'] as String?,
        img: json['img'] as String?,
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
        'link': link,
        'img': img,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
