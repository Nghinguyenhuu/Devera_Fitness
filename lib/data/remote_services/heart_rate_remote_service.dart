import 'package:devera_fitness/core/core.dart';
import 'package:get_it/get_it.dart';

import '../../utils/json_utils.dart';
import '../responses/heart_rate_response.dart';

import '../data.dart';
import 'package:http/http.dart' as http;

class HeartRateRemoteService implements IHeartRateRemoteService {
  late INetworkUtility _networkUtility;

  HeartRateRemoteService() : _networkUtility = GetIt.I.get<INetworkUtility>(instanceName: NetworkConstant.authorizationDomain);
  // final fsParser = FirestoreApiParser();

  @override
  Future<HeartRateResponse> getResponse({Map<String, dynamic>? params}) async {
    // final response = await _networkUtility.request('/data', Method.GET);
    final response = await http.get(Uri.parse('https://firestore.googleapis.com/v1/projects/yoll-afab3/databases/(default)/documents/data'));
    final map = JsonUtils.parseJsonFromFirebase(response.body);
    return HeartRateResponse.fromJson(map);
  }
}
