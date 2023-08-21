import 'package:devera_fitness/data/data.dart';
import 'package:devera_fitness/resources/gradient.dart';
import 'package:devera_fitness/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';

class WantToTrain extends StatelessWidget {
  const WantToTrain({super.key});

  @override
  Widget build(BuildContext context) {
    var exercises = [
      ExercisesModel(name: 'Fullbody Workout', quantities: 11, minutes: 32, image: Assets.images.png.imgWorkout1.path),
      ExercisesModel(name: 'Lowebody Workout', quantities: 12, minutes: 40, image: Assets.images.png.imgWorkout2.path),
      ExercisesModel(name: 'AB Workout', quantities: 14, minutes: 20, image: Assets.images.png.imgWorkout3.path),
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
              return buildExercises(exercises[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            shrinkWrap: true,
            itemCount: exercises.length,
          )
        ],
      ),
    );
  }

  Widget buildExercises(ExercisesModel exercises) {
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
                  exercises.name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Text(
                  "${exercises.quantities} Exercises| ${exercises.minutes} Minutes",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grayDark),
                ),
                SizedBox(height: 15),
                InkWell(
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
              exercises.image,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
