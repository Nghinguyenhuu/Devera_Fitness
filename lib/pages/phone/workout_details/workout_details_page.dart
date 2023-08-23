import 'package:flutter/material.dart';

import '../../../data/data.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../resources/gradient.dart';
import '../../pages.dart';
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
        ExercisesModel(name: "Warn up"),
        ExercisesModel(name: "Warn up"),
        ExercisesModel(name: "Warn up"),
        ExercisesModel(name: "Warn up"),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildAppBar(),
              Header(workout: workout),
              NeedToolsSection(workout: workout),
              ExercisesSection(exercises: workout.sets),
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