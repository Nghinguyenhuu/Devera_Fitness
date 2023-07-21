import '../../../data/responses/responses.dart';

abstract class IActivityRemoteService {
  Future<ActivityResponse> getResponse();
}
