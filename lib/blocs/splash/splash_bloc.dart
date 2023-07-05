import 'dart:async';

import '../../core/core.dart';
import '../../data/data.dart';
import 'splash_state.dart';

class SplashBloc extends BaseBloc<SplashState> {
  final ISplashRepository _splashRepository;

  SplashBloc(this._splashRepository);

  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();
  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
