import 'package:equatable/equatable.dart';

import '../models/models.dart';

class ActivityResponse extends Equatable {
  List<ActivityModel>? activities;

  ActivityResponse({this.activities});

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    if (activities != null) {
      data['activities'] = [];
      activities!.forEach((element) {
        data['activities'].add(element.toJson());
      });
    }
    return data;
  }

  ActivityResponse.fromJson(Map<String, dynamic>? json) {
    if (json?['activities'] != null) {
      activities = [];
      json?['activities'].forEach((e) {
        activities!.add(ActivityModel.fromJson(e));
      });
    }
  }

  @override
  List<Object?> get props => [activities];
}
