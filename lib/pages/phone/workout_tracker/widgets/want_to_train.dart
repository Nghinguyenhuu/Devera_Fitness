import 'package:flutter/material.dart';

import '../../../../data/data.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/gradient.dart';
import '../../../../router/router.dart';
import '../../../../widgets/gradient_text.dart';

class WantToTrain extends StatefulWidget {
  const WantToTrain({super.key});

  @override
  State<WantToTrain> createState() => _WantToTrainState();
}

class _WantToTrainState extends State<WantToTrain> {
  @override
  Widget build(BuildContext context) {
    var workouts = [
      WorkoutModel(name: 'Fullbody Workout', minutes: 32, image: Assets.images.png.imgWorkout1.path),
      WorkoutModel(name: 'Lowebody Workout', minutes: 40, image: Assets.images.png.imgWorkout2.path),
      WorkoutModel(name: 'AB Workout', minutes: 20, image: Assets.images.png.imgWorkout3.path),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'What Do You Want To Train',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          ListView.separated(
            itemBuilder: (context, index) {
              return buildExercises(workouts[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            shrinkWrap: true,
            itemCount: workouts.length,
          )
        ],
      ),
    );
  }

  Widget buildExercises(WorkoutModel workout) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.brandLight.withOpacity(0.2), AppColors.brandDark.withOpacity(0.2)],
          ),
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workout.name ?? '',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Text(
                  "${workout.sets?.length ?? 0} Exercises | ${workout.minutes ?? 0} Minutes",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grayDark),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.workoutDetails);
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: GradientText(
                      'View More',
                      gradient: AppGradient.blueGradient,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              workout.image ?? '',
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
