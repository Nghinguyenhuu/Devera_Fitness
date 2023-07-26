import 'package:flutter/cupertino.dart';

import '../resources/colors.dart';
import '../resources/shadow.dart';

class AppCardShadow extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Alignment? alignment;

  const AppCardShadow({super.key, required this.child, this.padding, this.alignment, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16), boxShadow: [AppShadow.cardShadow]),
      padding: padding,
      margin: margin,
      alignment: alignment,
      child: child,
    );
  }
}
