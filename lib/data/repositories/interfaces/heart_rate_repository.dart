import 'package:dartz/dartz.dart';
import 'package:devera_fitness/data/responses/heart_rate_response.dart';

import '../../../core/core.dart';
import '../../responses/responses.dart';

abstract class IHeartRateRepository {
  Future<Either<Failure, HeartRateResponse>> getResponse();
}
