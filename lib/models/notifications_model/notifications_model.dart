import 'notification.dart';

class NotificationsModel {
  int? length;
  List<MyNotification>? notifications;

  NotificationsModel({this.length, this.notifications});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      length: json['length'] as int?,
      notifications: (json['Notifications'] as List<dynamic>?)
          ?.map((e) => MyNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'length': length,
        'Notifications': notifications?.map((e) => e.toJson()).toList(),
      };
}
