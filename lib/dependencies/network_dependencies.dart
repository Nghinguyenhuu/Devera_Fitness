import 'package:get_it/get_it.dart';

import '../core/core.dart';

class NetworkDependencies {
  static Future setup(GetIt injector) async {
    final authorizationInterceptor = AuthorizationInterceptor();

    // network checker
    // injector.registerLazySingleton(() => InternetConnectionCheckerPlus());
    injector.registerLazySingleton<INetworkInfo>(() => NetworkInfo());

    // network utility for request
    injector.registerLazySingleton<INetworkUtility>(
      () => NetworkUtility(
        'https://firestore.googleapis.com/v1/projects/yoll-afab3/databases/(default)/documents',
        interceptors: [authorizationInterceptor],
      ),
      instanceName: NetworkConstant.authorizationDomain,
    );
  }
}
