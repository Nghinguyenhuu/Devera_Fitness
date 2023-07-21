import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class ActivityState extends Equatable {
  final bool? success;
  final String? error;
  final List<ActivityModel>? activities;

  ActivityState({
    ActivityState? state,
    bool? success,
    String? error,
    List<ActivityModel>? activities,
  })
      : success = success ?? state?.success,
        activities = activities ?? state?.activities,
        error = error ?? state?.error;

  @override
  List<Object?> get props => [success, error, activities];
}
