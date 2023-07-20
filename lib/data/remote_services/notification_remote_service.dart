import '../../gen/assets.gen.dart';
import '../responses/responses.dart';
import 'interfaces/interfaces.dart';

class NotificationRemoteService implements INotificationRemoteService {
  @override
  Future<NotificationResponse> getResponse() async {
    final response = Map<String, dynamic>.from(notification);
    return NotificationResponse.fromJson(response);
  }
}

Map<String, dynamic> notification = {
  "notifications": [
    {"id": 1, "title": "Hey, it’s time for lunch", "date": "2023-07-20 15:52:29.000", "image": Assets.images.png.imgLunch1.path},
    {"id": 2, "title": "Don’t miss your lowerbody workout", "date": "2023-07-20 12:52:29.000", "image": Assets.images.png.imgWorkout1.path},
    {"id": 3, "title": "Hey, let’s add some meals for your b..", "date": "2023-07-20 12:52:29.000", "image": Assets.images.png.imgLunch2.path},
    {"id": 4, "title": "Congratulations, You have finished A..", "date": "2023-07-19 15:52:29.000", "image": Assets.images.png.imgWorkout2.path},
    {"id": 5, "title": "Ups, You have missed your Lowerbo...", "date": "2023-07-18 15:52:29.000", "image": Assets.images.png.imgWorkout3.path}
  ]
};
