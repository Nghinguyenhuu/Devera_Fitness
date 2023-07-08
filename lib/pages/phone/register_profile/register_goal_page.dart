import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../resources/gradient.dart';
import '../../../resources/shadow.dart';
import '../../../widgets/app_button.dart';

class RegisterGoalPage extends StatefulWidget {
  const RegisterGoalPage({super.key});

  @override
  State<RegisterGoalPage> createState() => _RegisterGoalPageState();
}

class _RegisterGoalPageState extends State<RegisterGoalPage> {
  List<String> titles = ['Improve Shape', 'Lean & Tone', 'Lose a Fat'];
  List<String> subTitles = [
    'I have a low amount of body fat and need / want to build more muscle',
    'I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way',
    'I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass',
  ];
  List<Widget> images = [
    Assets.images.png.imgGoal1.image(),
    Assets.images.png.imgGoal2.image(),
    Assets.images.png.imgGoal3.image(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "What is your goal?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                'It will help us to choose a best program for you',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grayDark,
                ),
                textAlign: TextAlign.center,
              ),
              CarouselSlider.builder(
                itemBuilder: (context, index, int) {
                  return buildCarouselItem(
                    image: images[index],
                    title: titles[index],
                    subTitle: subTitles[index],
                  );
                },
                itemCount: titles.length,
                options: CarouselOptions(
                  viewportFraction: 0.8,
                  aspectRatio: 0.66,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                ),
              ),
              AppButton(
                padding: EdgeInsets.symmetric(vertical: 16),
                borderRadius: BorderRadius.circular(100),
                onTap: () {},
                child: Text(
                  'Confirm',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarouselItem({required Widget image, required String title, required String subTitle}) {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 70, left: 15, right: 15),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: AppGradient.blueGradient,
        boxShadow: [AppShadow.purpleShadow],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.white),
          ),
          SizedBox(height: 5),
          Container(height: 2, width: 64, color: AppColors.white),
          SizedBox(height: 20),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
