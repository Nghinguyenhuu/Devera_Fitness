import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../data.dart';
import '../responses/responses.dart';

class ActivityRepository extends IActivityRepository {
  final IActivityRemoteService remoteService;

  ActivityRepository({
    required this.remoteService,
  });

  @override
  Future<Either<Failure, ActivityResponse>> getResponse() async {
    try {
      final remoteData = await remoteService.getResponse();
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
