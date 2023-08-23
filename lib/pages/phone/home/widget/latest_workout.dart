import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/workout_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/gradient.dart';
import '../../../../resources/shadow.dart';
import '../../../../widgets/ink_well_wrapper.dart';
import '../../../pages.dart';

class LatestWorkout extends StatefulWidget {
  const LatestWorkout({super.key});

  @override
  State<LatestWorkout> createState() => _LatestWorkoutState();
}

class _LatestWorkoutState extends State<LatestWorkout> {
  List<WorkoutModel> workouts = [
    WorkoutModel(name: 'Fullbody Workout', caloriesBurn: 180, minutes: 20, progress: 0.4, image: Assets.images.png.imgWorkout1.path),
    WorkoutModel(name: 'Lowerbody Workout', caloriesBurn: 200, minutes: 30, progress: 0.2, image: Assets.images.png.imgWorkout2.path),
    WorkoutModel(name: 'Ab Workout', caloriesBurn: 180, minutes: 20, progress: 0.3, image: Assets.images.png.imgWorkout3.path),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: Text(
                'Latest Workout',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            InkWellWrapper(
              child: Text(
                'See more',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.gray),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        ListView.separated(
          itemBuilder: (context, index) {
            return buildWorkoutItem(workouts[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
          itemCount: workouts.length,
          shrinkWrap: true,
        ),
      ],
    );
  }

  Widget buildWorkoutItem(WorkoutModel model) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [AppShadow.dropShadow], borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          if (model.image != null) Image.asset(model.image!),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grayLight,
                    ),
                  ),
                  Text(
                    '${model.caloriesBurn} Calories Burn | ${model.minutes}minutes',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.gray),
                  ),
                  SizedBox(height: 10),
                  ProgressContainer(
                    progressStatus: model.progress ?? 0.0,
                  )
                ],
              ),
            ),
          ),
          InkWellWrapper(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                gradient: AppGradient.purpleGradient,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(1),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Assets.images.svg.icCheveronRignt.svg(
                  width: 14,
                  height: 14,
                  color: AppColors.secondaryDark,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
