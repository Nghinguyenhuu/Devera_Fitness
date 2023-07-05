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
        /// TODO: Add BASE_URL when server is available
        // 'BASE_URL',
        '',
        interceptors: [authorizationInterceptor],
      ),
      instanceName: NetworkConstant.authorizationDomain,
    );
  }
}

