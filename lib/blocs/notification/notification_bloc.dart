import 'dart:async';

import 'package:devera_fitness/data/data.dart';

import '../../core/core.dart';
import '../blocs.dart';

class NotificationBloc extends BaseBloc<NotificationState> {
  final INotificationRepository repository;

  NotificationBloc(this.repository);

  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Stream<List<NotificationModel>?> get notificationsStream => stateStream.map((event) => event.notifications);

  Future<void> loadData() async {
    repository.getResponse().then((value) => value.fold(
          (fail) => emit(NotificationState(state: state, error: fail.toString())),
          (data) => emit(NotificationState(state: state, notifications: data.notifications)),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
