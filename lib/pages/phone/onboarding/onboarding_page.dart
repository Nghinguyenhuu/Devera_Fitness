import 'package:collection/collection.dart';
import 'package:devera_fitness/pages/pages.dart';
import 'package:devera_fitness/pages/phone/onboarding/widgets/onboarding_view.dart';
import 'package:devera_fitness/widgets/ink_well_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController controller = PageController();

  bool isInit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  ThemeData get theme => Theme.of(context);

  S get localization => S.of(context);

  void _nextPage() {
    controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          allowImplicitScrolling: true,
          controller: controller,
          children: [
            OnBoardingView(
                title: localization.on_boarding_title_1,
                subtitle: localization.on_boarding_description_1,
                image: Assets.images.png.imgOnboarding1.image(fit: BoxFit.fill),
                onTap: () {
                  _nextPage();
                }),
            OnBoardingView(
                title: localization.on_boarding_title_2,
                subtitle: localization.on_boarding_description_2,
                image: Assets.images.png.imgOnboarding2.image(fit: BoxFit.fill),
                onTap: () {
                  _nextPage();
                }),
            OnBoardingView(
                title: localization.on_boarding_title_3,
                subtitle: localization.on_boarding_description_3,
                image: Assets.images.png.imgOnboarding3.image(fit: BoxFit.fill),
                onTap: () {
                  _nextPage();
                }),
            OnBoardingView(
                title: localization.on_boarding_title_4,
                subtitle: localization.on_boarding_description_4,
                image: Assets.images.png.imgOnboarding4.image(fit: BoxFit.fill),
                onTap: () {
                  _nextPage();
                })
          ],
          pageSnapping: false,
        ),
      ),
    );
  }
}
