import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../responses/notification.dart';
import '../../responses/responses.dart';

abstract class INotificationRepository {
  Future<Either<Failure, NotificationResponse>> getResponse();
}
