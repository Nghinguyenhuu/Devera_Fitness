import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';
import '../../../../widgets/ink_well_wrapper.dart';

class OnBoardingView extends StatefulWidget {
  final String title;
  final String subtitle;
  final Widget image;
  final Function() onTap;
  const OnBoardingView({super.key, required this.title, required this.subtitle, required this.image, required this.onTap});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: widget.image),
        SizedBox(height: 30),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: theme.textTheme.displayMedium,
                ),
                SizedBox(height: 15),
                Text(
                  widget.subtitle,
                  style: theme.textTheme.labelLarge?.copyWith(color: AppColors.grayDark),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWellWrapper(
                      borderRadius: BorderRadius.circular(25),
                      onTap: widget.onTap,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [AppColors.brandLight, AppColors.brandDark],
                            )),
                        alignment: Alignment.center,
                        child: Assets.images.svg.icCheveronRignt.svg(
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}
