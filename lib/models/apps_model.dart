class AppsModel {
  String? id;
  String? title;
  String? image;
  String? description;
  String? created;
  String? updated;

  AppsModel({
    this.id,
    this.title,
    this.image,
    this.description,
    this.created,
    this.updated,
  });

  factory AppsModel.fromJson(Map<String, dynamic> json) => AppsModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        created: json['created'] as String?,
        updated: json['updated'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'description': description,
        'created': created,
        'updated': updated,
      };
}
