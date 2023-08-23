import 'package:devera_fitness/pages/pages.dart';
import 'package:devera_fitness/widgets/app_button.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../../resources/gradient.dart';

class WorkoutTrackerPage extends StatefulWidget {
  const WorkoutTrackerPage({super.key});

  @override
  State<WorkoutTrackerPage> createState() => _WorkoutTrackerPageState();
}

class _WorkoutTrackerPageState extends State<WorkoutTrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildAppBar(),
              buildDailyWorkoutSchedule(),
              UpcomingWorkout(),
              WantToTrain(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.blueGradient,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                CustomAppBar(
                  title: 'Workout Tracker',
                  lightTheme: true,
                ),
                WorkoutProgress(
                  lightTheme: true,
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            decoration:
                BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100))),
            alignment: Alignment.center,
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: AppColors.gray),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDailyWorkoutSchedule() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.brandLight.withOpacity(0.2), AppColors.brandDark.withOpacity(0.2)]),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Daily Workout Schedule',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          AppButton(
            onTap: () {},
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            borderRadius: BorderRadius.circular(50),
            child: Text(
              'Check',
              style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.white, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
