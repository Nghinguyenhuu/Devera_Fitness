import 'package:flutter/cupertino.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/gradient.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_card_shadow.dart';
import '../../../../widgets/gradient_text.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildProfile(),
          SizedBox(height: 15),
          _buildPersonalData(),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.border),
          child: Assets.images.png.imgWorkout3.image(fit: BoxFit.cover),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stefani Wong',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              Text(
                'Lose a Fat Program',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grayDark),
              ),
            ],
          ),
        ),
        AppButton(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          borderRadius: BorderRadius.circular(100),
          child: Text(
            'Edit',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalData() {
    List<int> profileSectionValues = [180, 65, 22];

    return Row(
      children: [
        buildSectionItem('Height', "${profileSectionValues[0]}cm"),
        SizedBox(width: 15),
        buildSectionItem('Weight', "${profileSectionValues[1]}kg"),
        SizedBox(width: 15),
        buildSectionItem('Age', "${profileSectionValues[2]}yo"),
      ],
    );
  }

  Widget buildSectionItem(String title, String value) {
    return Expanded(
      child: AppCardShadow(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            GradientText(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              gradient: AppGradient.blueGradient,
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(fontSize: 12, color: AppColors.grayDark),
            )
          ],
        ),
      ),
    );
  }
}
