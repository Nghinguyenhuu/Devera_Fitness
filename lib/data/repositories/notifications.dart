import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../data.dart';
import '../responses/notification.dart';

class NotificationRepository extends INotificationRepository {
  final INotificationRemoteService remoteService;

  NotificationRepository({
    required this.remoteService,
  });

  @override
  Future<Either<Failure, NotificationResponse>> getResponse() async {
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
