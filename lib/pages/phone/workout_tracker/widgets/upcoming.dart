import 'package:devera_fitness/extensions/date_extension.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/activity_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';
import '../../../../widgets/app_card_shadow.dart';
import '../../../pages.dart';

class UpcomingWorkout extends StatelessWidget {
  const UpcomingWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    var activities = [
      ActivityModel(title: "Fullbody Workout", image: Assets.images.png.imgWorkout1.path, date: DateTime.now().add(Duration(hours: 1))),
      ActivityModel(title: "Upperbody Workout", image: Assets.images.png.imgWorkout2.path, date: DateTime.now().add(Duration(days: 1, seconds: 1))),
      ActivityModel(title: "Fullbody Workout", image: Assets.images.png.imgWorkout3.path, date: DateTime.now().add(Duration(days: 2))),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Latest Workout',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              InkWell(
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
              return buildUpcomingItem(activities[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            shrinkWrap: true,
            itemCount: 2,
          )
        ],
      ),
    );
  }

  Widget buildUpcomingItem(ActivityModel activity) {
    var dayUpComing = 0;
    if (activity.date != null) {
      dayUpComing = activity.date!.difference(DateTime.now()).inDays;
    }
    return AppCardShadow(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(activity.image ?? ''),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title ?? '',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                if (dayUpComing < 1)
                  Text(
                    'Today, ${activity.date!.convertDateTimeToString(fromPattern: 'hh:mm aa')}',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.gray),
                  )
                else
                  Text(
                    '${activity.date!.convertDateTimeToString(fromPattern: 'MMMM dd, hh:mm aa')}',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.gray),
                  ),
              ],
            ),
          ),
          CustomSwitch()
        ],
      ),
    );
  }
}
