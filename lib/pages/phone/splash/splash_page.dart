import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../blocs/blocs.dart';
import '../../../constants.dart';
import '../../../core/core.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../router/router.dart';

class SplashPage extends StatefulWidget {
  final SplashBloc bloc;

  SplashPage(this.bloc);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashBloc> {
  @override
  SplashBloc get bloc => widget.bloc;

  @override
  void initData() {
    super.initData();
    bloc.loadData().then((value) => Navigator.pushReplacementNamed(context, Routes.onBoarding));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Assets.images.png.imgLogo.image(),
            SizedBox(height: 15),
            Text(
              localization.slogan,
              style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.grayDark),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
