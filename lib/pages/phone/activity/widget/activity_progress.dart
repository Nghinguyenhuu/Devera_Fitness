import 'dart:math';

import 'package:devera_fitness/resources/gradient.dart';
import 'package:flutter/cupertino.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/shadow.dart';
import '../../../../widgets/app_button.dart';

List<String> weekDays = const ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

class ActivityProgress extends StatelessWidget {
  const ActivityProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            height: 200,
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
              AppShadow.cardShadow,
            ]),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                weekDays.length,
                (index) => buildProgressSectionItem(
                  context,
                  Random().nextDouble(),
                  weekDays[index],
                  index % 2 == 0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildProgressSectionItem(BuildContext context, double sectionValue, String label, bool isEven) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 22,
            height: 135,
            decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: sectionValue * 135,
              decoration:
                  BoxDecoration(gradient: isEven ? AppGradient.purpleGradient : AppGradient.blueGradient, borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: AppColors.grayDark),
        )
      ],
    );
  }
}
