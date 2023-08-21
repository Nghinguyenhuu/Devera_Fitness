import 'package:flutter/cupertino.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../widgets/ink_well_wrapper.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool lightTheme;

  const CustomAppBar({super.key, required this.title, this.lightTheme = false});

  @override
  Widget build(BuildContext context) {
    var buttonColor = AppColors.border;
    var textColor = AppColors.black;
    if (lightTheme) {
      buttonColor = AppColors.white;
      textColor = AppColors.white;
    }
    return Row(
      children: [
        InkWellWrapper(
            onTap: () {
              Navigator.pop(context);
            },
            width: 36,
            height: 36,
            color: buttonColor,
            borderRadius: BorderRadius.circular(8),
            paddingChild: EdgeInsets.all(8),
            child: Assets.images.svg.icBack.svg(
              width: 16,
              height: 16,
              color: AppColors.black,
            )),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
        InkWellWrapper(
          width: 36,
          height: 36,
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
          paddingChild: EdgeInsets.symmetric(vertical: 16, horizontal: 13),
          child: Assets.images.svg.icDetails.svg(
            width: 10,
            height: 4,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
