import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../resources/gradient.dart';
import '../../../resources/shadow.dart';
import '../../../router/router.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/ink_well_wrapper.dart';
import '../../pages.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(),
              buildBanner(),
              buildTodayTarget(),
              ActivityStatus(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(
                    'Workout Progress',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
                  AppButton(
                    padding: EdgeInsets.all(10),
                    borderRadius: BorderRadius.circular(50),
                    child: Row(
                      children: [
                        Text(
                          'Weekly',
                          style: TextStyle(fontSize: 10, color: AppColors.white),
                        ),
                        SizedBox(width: 5),
                        Assets.images.svg.icDropdown.svg(width: 15, height: 15, color: AppColors.white)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              WorkoutProgress(),
              LatestWorkout(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome Back,',
                style: TextStyle(fontSize: 12, color: AppColors.gray, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 5),
              Text(
                'Stefani Wong',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        InkWellWrapper(
          onTap: () {
            Navigator.pushNamed(context, Routes.notification);
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: AppColors.border, boxShadow: [AppShadow.cardShadow]),
            child: Assets.images.svg.icNotification.svg(width: 18, height: 18, fit: BoxFit.cover),
          ),
        )
      ],
    );
  }

  Widget buildBanner() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        image: DecorationImage(image: Assets.images.png.imgBannerBackground.provider(), fit: BoxFit.cover),
        gradient: AppGradient.blueGradient,
        boxShadow: [AppShadow.blueShadow],
      ),
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BMI (Body Mass Index)',
                style: TextStyle(fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                'You have a normal weight',
                style: TextStyle(fontSize: 12, color: AppColors.white, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 15),
              AppButton(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.workoutTracker);
                  },
                  gradient: AppGradient.purpleGradient,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  borderRadius: BorderRadius.circular(50),
                  child: Text(
                    'View More',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.white),
                  )),
            ],
          ),
          buildBannerPie()
        ],
      ),
    );
  }

  Widget buildBannerPie() {
    double value = 20.1;
    double maxValue = 40;
    return SizedBox(
      width: 106,
      height: 106,
      child: PieChart(PieChartData(sections: [
        PieChartSectionData(value: maxValue, color: AppColors.white, title: ''),
        PieChartSectionData(
          value: value,
          color: AppColors.secondaryDark,
          titlePositionPercentageOffset: 0.5,
          titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.white),
        ),
      ], centerSpaceRadius: 0)),
    );
  }

  Widget buildTodayTarget() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.activity);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            AppColors.brandLight.withOpacity(0.2),
            AppColors.brandDark.withOpacity(0.2),
          ]),
        ),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today Target',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            AppButton(
                borderRadius: BorderRadius.circular(50),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text(
                  'Check',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white),
                ))
          ],
        ),
      ),
    );
  }
}
