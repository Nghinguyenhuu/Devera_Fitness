import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import '../../../resources/colors.dart';
import '../../../router/router.dart';
import '../../../widgets/app_button.dart';
import 'widgets/onboarding_view.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController controller = PageController();

  bool isInit = false;

  List<Widget> images = [
    Assets.images.png.imgOnboarding1.image(fit: BoxFit.fill),
    Assets.images.png.imgOnboarding2.image(fit: BoxFit.fill),
    Assets.images.png.imgOnboarding3.image(fit: BoxFit.fill),
    Assets.images.png.imgOnboarding4.image(fit: BoxFit.fill),
  ];

  List<String> titles = [];
  List<String> subtitles = [];

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

  void initData() {
    if (!isInit) {
      titles = [
        localization.on_boarding_title_1,
        localization.on_boarding_title_2,
        localization.on_boarding_title_3,
        localization.on_boarding_title_4,
      ];
      subtitles = [
        localization.on_boarding_description_1,
        localization.on_boarding_description_2,
        localization.on_boarding_description_3,
        localization.on_boarding_description_4,
      ];
      isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      body: PageView.builder(
        allowImplicitScrolling: true,
        controller: controller,
        itemBuilder: (context, index) {
          if (index < titles.length - 1) {
            return OnBoardingView(
              title: titles[index],
              subtitle: subtitles[index],
              image: images[index],
              onTap: _nextPage,
            );
          }
          return buildGetStarted();
        },
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        pageSnapping: false,
      ),
    );
  }

  Widget buildGetStarted() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
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
            AppButton(
              padding: EdgeInsets.symmetric(vertical: 18),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.login);
              },
              borderRadius: BorderRadius.circular(100),
              child: Text(
                'Get Started',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
