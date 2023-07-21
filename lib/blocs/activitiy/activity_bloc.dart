import 'dart:async';

import '../../core/core.dart';
import '../../data/data.dart';
import '../blocs.dart';

class ActivityBloc extends BaseBloc<ActivityState> {
  final IActivityRepository repository;

  ActivityBloc(this.repository);

  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Stream<List<ActivityModel>?> get activitiesStream => stateStream.map((event) => event.activities);

  Future<void> loadData() async {
    repository.getResponse().then((value) => value.fold(
          (fail) => emit(ActivityState(state: state, error: fail.toString())),
          (data) => emit(ActivityState(state: state, activities: data.activities)),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
