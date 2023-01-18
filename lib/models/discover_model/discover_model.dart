import 'discover.dart';

class DiscoverModel {
  int? length;
  List<Discover>? discovers;

  DiscoverModel({this.length, this.discovers});

  factory DiscoverModel.fromJson(Map<String, dynamic> json) => DiscoverModel(
        length: json['length'] as int?,
        discovers: (json['Discovers'] as List<dynamic>?)
            ?.map((e) => Discover.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'length': length,
        'Discovers': discovers?.map((e) => e.toJson()).toList(),
      };
}
