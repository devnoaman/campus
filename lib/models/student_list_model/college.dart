class College {
  String? title;

  College({this.title});

  factory College.fromJson(Map<String, dynamic> json) => College(
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };

  College copyWith({
    String? title,
  }) {
    return College(
      title: title ?? this.title,
    );
  }
}
