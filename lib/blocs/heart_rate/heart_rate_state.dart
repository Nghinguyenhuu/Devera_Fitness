import 'package:equatable/equatable.dart';

import '../../data/models/heart_rate_model.dart';

class HeartRateState extends Equatable {
  final bool? success;
  final String? error;
  final List<HeartRateModel>? heartRates;

  HeartRateState({
    HeartRateState? state,
    bool? success,
    String? error,
    List<HeartRateModel>? heartRates,
  })  : success = success ?? state?.success,
        heartRates = heartRates ?? state?.heartRates,
        error = error ?? state?.error;

  @override
  List<Object?> get props => [success, error, heartRates];
}
