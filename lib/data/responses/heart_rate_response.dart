import 'package:equatable/equatable.dart';

import '../models/heart_rate_model.dart';

class HeartRateResponse extends Equatable {
  List<HeartRateModel>? data;

  HeartRateResponse({this.data});

  HeartRateResponse.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      this.data = [];
      json['results'].forEach((e) {
        data!.add(HeartRateModel.fromJson(e));
      });
    }
  }

  @override
  List<Object?> get props => [data];
}
