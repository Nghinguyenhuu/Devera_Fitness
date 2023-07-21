import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class NotificationState extends Equatable {
  final bool? success;
  final String? error;
  final List<ActivityModel>? notifications;

  NotificationState({
    NotificationState? state,
    bool? success,
    String? error,
    List<ActivityModel>? notifications,
  })  : success = success ?? state?.success,
        notifications = notifications ?? state?.notifications,
        error = error ?? state?.error;

  @override
  List<Object?> get props => [success, error, notifications];
}
