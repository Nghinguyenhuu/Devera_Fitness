import 'ink_well_wrapper.dart';
import 'package:flutter/cupertino.dart';

import '../resources/colors.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Function()? onTap;

  const AppButton({super.key, required this.child, this.padding, this.borderRadius, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      onTap: onTap,
      borderRadius: borderRadius ?? BorderRadius.circular(100),
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [AppColors.brandLight, AppColors.brandDark]), boxShadow: [
          BoxShadow(
            color: AppColors.brandDark.withOpacity(0.3),
            offset: Offset(0, 10),
            blurRadius: 22,
          )
        ]),
        alignment: Alignment.center,
        padding: padding,
        child: child,
      ),
    );
  }
}
