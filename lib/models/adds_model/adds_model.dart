import 'add.dart';

class AddsModel {
  int? length;
  List<Add>? adds;

  AddsModel({this.length, this.adds});

  factory AddsModel.fromJson(Map<String, dynamic> json) => AddsModel(
        length: json['length'] as int?,
        adds: (json['Adds'] as List<dynamic>?)
            ?.map((e) => Add.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'length': length,
        'Adds': adds?.map((e) => e.toJson()).toList(),
      };
}
