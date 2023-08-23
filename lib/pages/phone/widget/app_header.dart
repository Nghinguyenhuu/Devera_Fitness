import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String? subTitle;

  const AppHeader({super.key, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        InkWell(
          child: Text(
            subTitle ?? '',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.gray),
          ),
        ),
      ],
    );
  }
}
