import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';

import '../../../resources/colors.dart';
import '../../../resources/gradient.dart';
import '../../../resources/shadow.dart';
import '../../../widgets/gradient_text.dart';

class CustomStep extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final int currentStep;
  final bool isDottedLine;

  const CustomStep({
    super.key,
    required this.currentStep,
    this.title,
    this.subTitle,
    this.isDottedLine = true,
    this.titleStyle,
    this.subTitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GradientText(
          '0${currentStep + 1}',
          gradient: AppGradient.purpleGradient,
          style: TextStyle(fontSize: 14, height: 1.5),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      gradient: AppGradient.purpleGradient,
                      shape: BoxShape.circle,
                      boxShadow: [AppShadow.purpleShadow],
                    ),
                  ),
                  Text(
                    title ?? 'dsadsads',
                    style: TextStyle(),
                  )
                ],
              ),
              DottedLine(
                direction: Axis.vertical,
                lineLength: 50,
                dashLength: 5,
                dashGradient: [
                  AppColors.secondaryLight,
                  AppColors.secondaryDark,
                ],
                dashGapLength: 5,
              )
            ],
          ),
        ),
      ],
    );
  }
}
