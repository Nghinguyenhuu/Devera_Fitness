import 'package:flutter/material.dart';

import '../../../../../data/models/workout_model.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/gradient.dart';
import '../../../../../router/router.dart';
import '../../../../../widgets/app_button.dart';
import '../widget/custom_app_bar.dart';
import 'sections/sections.dart';

class WorkoutDetailsPage extends StatefulWidget {
  const WorkoutDetailsPage({super.key});

  @override
  State<WorkoutDetailsPage> createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  WorkoutModel workout = WorkoutModel(name: "FullBody Workout", caloriesBurn: 320, minutes: 32, date: DateTime.now().add(Duration(hours: 1)), tools: [
    ToolModel(name: 'Barbell', image: Assets.images.png.imgBarbell.path),
    ToolModel(name: 'SkippingRope', image: Assets.images.png.imgSkippingRope.path),
    ToolModel(name: 'Barbell', image: Assets.images.png.imgBarbell.path),
    ToolModel(name: 'SkippingRope', image: Assets.images.png.imgSkippingRope.path),
  ], sets: [
    ExercisesModel(
      exercises: [
        ExercisesModel(name: "Warn up", timer: Duration(minutes: 5), isTimer: true),
        ExercisesModel(name: "Jumping Jack", quantity: 12),
        ExercisesModel(name: "Skipping", quantity: 15),
        ExercisesModel(name: "Squats", quantity: 20),
        ExercisesModel(name: "Arm Raises", timer: Duration(seconds: 53), isTimer: true),
      ],
    ),
    ExercisesModel(
      exercises: [
        ExercisesModel(name: "Warn up"),
        ExercisesModel(name: "Warn up"),
        ExercisesModel(name: "Warn up"),
        ExercisesModel(name: "Warn up"),
      ],
    ),
  ]);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments;
    if (data != null) {}

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  buildAppBar(),
                  Header(workout: workout),
                  NeedToolsSection(workout: workout),
                  ExercisesSection(exercises: workout.sets),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: IntrinsicHeight(
                  child: AppButton(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.startWorkout);
                    },
                    child: Text(
                      'Start Workout',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white),
                    ),
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(30),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.blueGradient,
        image: DecorationImage(
          image: Assets.images.png.imgGoal1.provider(),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: CustomAppBar(
              title: '',
              lightTheme: true,
            ),
          ),
          SizedBox(height: 200),
          Container(
            height: 30,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                )),
            alignment: Alignment.center,
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.gray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
