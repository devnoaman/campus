class Stage {
  String? title;

  Stage({this.title});

  factory Stage.fromJson(Map<String, dynamic> json) => Stage(
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };

  Stage copyWith({
    String? title,
  }) {
    return Stage(
      title: title ?? this.title,
    );
  }
}
