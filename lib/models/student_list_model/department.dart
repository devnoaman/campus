class Department {
  String? title;

  Department({this.title});

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };

  Department copyWith({
    String? title,
  }) {
    return Department(
      title: title ?? this.title,
    );
  }
}
