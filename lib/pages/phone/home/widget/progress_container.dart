import 'package:flutter/cupertino.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/gradient.dart';

class ProgressContainer extends StatelessWidget {
  final double progressStatus;

  const ProgressContainer({super.key, required this.progressStatus});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.border,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              topLeft: Radius.circular(50),
            ),
            gradient: AppGradient.progressGradient,
          ),
          width: MediaQuery.of(context).size.width * progressStatus,
        )
      ],
    );
  }
}
