// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello World`
  String get hello_world {
    return Intl.message(
      'Hello World',
      name: 'hello_world',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language {
    return Intl.message(
      'Change language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Everybody Can Train`
  String get slogan {
    return Intl.message(
      'Everybody Can Train',
      name: 'slogan',
      desc: '',
      args: [],
    );
  }

  /// `Track Your Goal`
  String get on_boarding_title_1 {
    return Intl.message(
      'Track Your Goal',
      name: 'on_boarding_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Get Burn`
  String get on_boarding_title_2 {
    return Intl.message(
      'Get Burn',
      name: 'on_boarding_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Eat Well`
  String get on_boarding_title_3 {
    return Intl.message(
      'Eat Well',
      name: 'on_boarding_title_3',
      desc: '',
      args: [],
    );
  }

  /// `Improve Sleep  Quality`
  String get on_boarding_title_4 {
    return Intl.message(
      'Improve Sleep  Quality',
      name: 'on_boarding_title_4',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals`
  String get on_boarding_description_1 {
    return Intl.message(
      'Don\'t worry if you have trouble determining your goals, We can help you determine your goals and track your goals',
      name: 'on_boarding_description_1',
      desc: '',
      args: [],
    );
  }

  /// `Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever`
  String get on_boarding_description_2 {
    return Intl.message(
      'Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever',
      name: 'on_boarding_description_2',
      desc: '',
      args: [],
    );
  }

  /// `Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun`
  String get on_boarding_description_3 {
    return Intl.message(
      'Let\'s start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun',
      name: 'on_boarding_description_3',
      desc: '',
      args: [],
    );
  }

  /// `Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning`
  String get on_boarding_description_4 {
    return Intl.message(
      'Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning',
      name: 'on_boarding_description_4',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
