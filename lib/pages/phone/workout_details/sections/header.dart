import 'package:devera_fitness/extensions/date_extension.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../data/models/workout_model.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../resources/colors.dart';
import '../../../../../../resources/gradient.dart';
import '../../../../../../resources/shadow.dart';

class Header extends StatelessWidget {
  final WorkoutModel workout;

  const Header({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workout.name ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${workout.sets?.length ?? 0} exercises | ${workout.minutes ?? 0} minutes | ${workout.caloriesBurn ?? 0} Calories Burn',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.grayDark),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [AppShadow.cardShadow],
                  ),
                  padding: EdgeInsets.all(8),
                  child: Assets.images.svg.icFollow.svg(width: 16, height: 16))
            ],
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              gradient: AppGradient.blue20,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Assets.images.svg.icCalendar.svg(width: 22, height: 22, color: AppColors.grayDark),
                ),
                Expanded(
                  child: Text(
                    'Schedule Workout',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grayDark),
                  ),
                ),
                Text(
                  '${workout.date?.convertDateTimeToString(fromPattern: 'M/dd, hh:mm aa')}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grayDark),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Assets.images.svg.icCheveronRignt.svg(width: 16, height: 16, color: AppColors.grayDark),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.2),
              gradient: AppGradient.purpleGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Assets.images.svg.icSwap.svg(width: 22, height: 22, color: AppColors.grayDark),
                ),
                Expanded(
                  child: Text(
                    'Difficulty',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grayDark),
                  ),
                ),
                Text(
                  'Beginner',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grayDark),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Assets.images.svg.icCheveronRignt.svg(width: 16, height: 16, color: AppColors.grayDark),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
