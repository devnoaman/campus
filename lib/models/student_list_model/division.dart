class Division {
  String? title;

  Division({this.title});

  factory Division.fromJson(Map<String, dynamic> json) => Division(
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };

  Division copyWith({
    String? title,
  }) {
    return Division(
      title: title ?? this.title,
    );
  }
}
