import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../responses/responses.dart';

abstract class IActivityRepository {
  Future<Either<Failure, ActivityResponse>> getResponse();
}
