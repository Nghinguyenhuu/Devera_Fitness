import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/data.dart';
import '../../../../extensions/date_extension.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/shadow.dart';
import '../../../../widgets/ink_well_wrapper.dart';

class LatestActivity extends StatefulWidget {
  final List<ActivityModel>? activities;

  const LatestActivity({super.key, this.activities});

  @override
  State<LatestActivity> createState() => _LatestActivityState();
}

class _LatestActivityState extends State<LatestActivity> {
  bool isSeeMore = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Latest Activity',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              InkWellWrapper(
                onTap: () {
                  setState(() {
                    isSeeMore = !isSeeMore;
                  });
                },
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
              if (index < (widget.activities?.length ?? 0)) {
                return buildActivityItem(widget.activities![index]);
              } else {
                return SizedBox();
              }
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10);
            },
            itemCount: isSeeMore ? 2 : 5,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }

  Widget buildActivityItem(ActivityModel activity) {
    String subTitle = '';

    Duration timeAgo = DateTime.now().difference(activity.date ?? DateTime.now());
    if (timeAgo >= Duration(days: 1)) {
      subTitle = activity.date!.convertDateTimeToString(fromPattern: "dd MMMM");
    } else if (timeAgo >= Duration(hours: 1)) {
      subTitle = 'About ${timeAgo.inHours} hours ago';
    } else if (timeAgo >= Duration(minutes: 1)) {
      subTitle = 'About ${timeAgo.inMinutes} minutes ago';
    } else {
      subTitle = 'Just now';
    }

    return Container(
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [AppShadow.cardShadow]),
      padding: EdgeInsets.all(15),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.border,
                ),
                child: Image.asset(
                  activity.image ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return SizedBox();
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.title ?? '',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        subTitle,
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.grayDark),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Assets.images.svg.icCardDetails.svg(),
          )
        ],
      ),
    );
  }
}
