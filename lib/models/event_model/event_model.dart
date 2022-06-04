import 'event.dart';

class EventModel {
  int? length;
  List<Event>? events;

  EventModel({this.length, this.events});

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        length: json['length'] as int?,
        events: (json['Events'] as List<dynamic>?)
            ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'length': length,
        'Events': events?.map((e) => e.toJson()).toList(),
      };
}
