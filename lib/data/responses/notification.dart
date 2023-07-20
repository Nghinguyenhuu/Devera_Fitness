import 'package:equatable/equatable.dart';

import '../models/notification_model.dart';

class NotificationResponse extends Equatable {
  List<NotificationModel>? notifications;

  NotificationResponse({this.notifications});

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    if (notifications != null) {
      data['notifications'] = [];
      notifications!.forEach((element) {
        data['notification'].add(element.toJson());
      });
    }
    return data;
  }

  NotificationResponse.fromJson(Map<String, dynamic>? json) {
    if (json?['notifications'] != null) {
      notifications = [];
      json?['notifications'].forEach((e) {
        notifications!.add(NotificationModel.fromJson(e));
      });
    }
  }

  @override
  List<Object?> get props => [notifications];
}
