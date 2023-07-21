import 'package:flutter/cupertino.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/gradient.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/gradient_text.dart';

class TodayTarget extends StatelessWidget {
  const TodayTarget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(colors: [
            AppColors.brandLight.withOpacity(0.2),
            AppColors.brandDark.withOpacity(0.2),
          ])),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                'Today Target',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              )),
              AppButton(
                  borderRadius: BorderRadius.circular(8),
                  padding: EdgeInsets.all(5),
                  child: Assets.images.svg.icPlus.svg(width: 14, height: 14, color: AppColors.white))
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              buildTodayTargetItem(Assets.images.png.imgTargetToday.image(), '8L', 'Water Intake'),
              SizedBox(width: 15),
              buildTodayTargetItem(Assets.images.png.imgTargetToday1.image(), '2400', 'Foot Steps'),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTodayTargetItem(Widget leading, String title, String subTitle) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(width: 24, height: 40, child: leading),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  gradient: AppGradient.blueGradient,
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayDark,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
