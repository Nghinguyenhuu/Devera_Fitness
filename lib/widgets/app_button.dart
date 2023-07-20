import 'package:flutter/cupertino.dart';

import '../resources/colors.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final Function()? onTap;

  const AppButton({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.onTap,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient ?? LinearGradient(colors: [AppColors.brandLight, AppColors.brandDark]),
          boxShadow: [
            BoxShadow(
              color: AppColors.brandDark.withOpacity(0.5),
              offset: Offset(0, 10),
              blurRadius: 22,
            ),
          ],
          borderRadius: borderRadius,
        ),
        alignment: Alignment.center,
        padding: padding,
        child: child,
      ),
    );
  }
}
