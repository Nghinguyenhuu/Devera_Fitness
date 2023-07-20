import '../../../data/responses/responses.dart';

abstract class INotificationRemoteService {
  Future<NotificationResponse> getResponse();
}
