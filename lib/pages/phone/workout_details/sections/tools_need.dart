import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/models/workout_model.dart';
import '../../../../../../resources/colors.dart';
import '../../widget/app_header.dart';

class NeedToolsSection extends StatelessWidget {
  final WorkoutModel workout;

  const NeedToolsSection({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppHeader(
            title: "You'll Need",
            subTitle: '5 items',
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 158,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return buildItemNeedCard(workout.tools![index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },
                scrollDirection: Axis.horizontal,
                itemCount: workout.tools?.length ?? 0),
          )
        ],
      ),
    );
  }

  Widget buildItemNeedCard(ToolModel tools) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 130,
          width: 130,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.border,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            tools.image ?? '',
            errorBuilder: (_, __, ___) => SizedBox(),
          ),
        ),
        SizedBox(height: 5),
        Text(
          tools.name ?? '',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
