import '../../responses/heart_rate_response.dart';

import '../../../data/responses/responses.dart';

abstract class IHeartRateRemoteService {
  Future<HeartRateResponse> getResponse({Map<String, dynamic>? params});
}
