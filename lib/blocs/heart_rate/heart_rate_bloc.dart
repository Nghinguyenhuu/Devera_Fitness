import 'dart:async';

import 'package:devera_fitness/blocs/blocs.dart';

import '../../core/core.dart';
import '../../data/data.dart';

class HeartRateBloc extends BaseBloc<HeartRateState> {
  final IHeartRateRepository heartRateRepository;

  HeartRateBloc(this.heartRateRepository);

  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);
  Stream<List<HeartRateModel>?> get heartRatesStream => stateStream.map((event) => event.heartRates);

  Future<void> loadData() async {
    heartRateRepository.getResponse().then(
          (value) => value.fold(
            (l) => null,
            (data) => emit(HeartRateState(state: state, heartRates: data.data)),
          ),
        );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
