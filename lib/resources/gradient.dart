import 'package:flutter/cupertino.dart';

import 'colors.dart';

class AppGradient {
  static LinearGradient blueGradient = LinearGradient(colors: [
    AppColors.brandLight,
    AppColors.brandDark,
  ]);
  static LinearGradient purpleGradient = LinearGradient(colors: [
    AppColors.secondaryLight,
    AppColors.secondaryDark,
  ]);
  static LinearGradient progressGradient = LinearGradient(colors: [
    AppColors.brandDark,
    AppColors.secondaryDark,
  ]);
}
