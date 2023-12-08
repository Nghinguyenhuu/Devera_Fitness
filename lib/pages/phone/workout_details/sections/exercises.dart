import 'package:devera_fitness/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../data/models/workout_model.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../resources/colors.dart';
import '../../widget/app_header.dart';

class ExercisesSection extends StatelessWidget {
  final List<ExercisesModel>? exercises;

  const ExercisesSection({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Column(
        children: [
          AppHeader(title: 'Exercises', subTitle: '${exercises?.length ?? 0} Sets'),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Set ${index + 1}',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                    buildSetItem(exercises![index]),
                  ],
                );
              },
              shrinkWrap: true,
              itemCount: exercises?.length ?? 0)
        ],
      ),
    );
  }

  Widget buildSetItem(ExercisesModel sets) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return buildExercisesCard(sets.exercises![index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 15);
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: sets.exercises?.length ?? 0,
    );
  }

  Widget buildExercisesCard(ExercisesModel exercises) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.border,
          ),
          child: exercises.image != null
              ? Image.asset(
                  exercises.image!,
                )
              : null,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercises.name ?? ''),
                SizedBox(height: 5),
                if (exercises.isTimer == true)
                  Text("${exercises.timer?.formatDurationInMmSs()}",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.grayDark))
                else
                  Text(
                    "${exercises.quantity ?? 0}x",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.grayDark),
                  )
              ],
            ),
          ),
        ),
        Assets.images.svg.icArrowRightCircle.svg()
      ],
    );
  }
}
