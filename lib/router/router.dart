import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Routes {
  static String get splash => '/splash';

  static String get onBoarding => '/onBoarding';

  static String get home => '/home';

  static String get signUp => '/signUp';

  static String get registerProfile => '/registerProfile';

  static String get registerGoal => '/registerGoal';

  static String get registerSuccess => '/registerSuccess';

  static String get login => '/login';

  static String get notification => '/notification';

  static String get activity => '/activity';

  static getRoute(RouteSettings settings) {
    Widget widget;
    try {
      widget = GetIt.I.get<Widget>(instanceName: settings.name);
    } catch (e) {
      widget = Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Text(
                  '404 NOT FOUND',
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      );
    }
    return CupertinoPageRoute(builder: (_) => widget, settings: settings);
  }
}
