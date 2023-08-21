import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Function(bool)? onChange;

  const CustomSwitch({super.key, this.value = false, this.onChange});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChange?.call(!value);
        setState(() {
          value = !value;
        });
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          gradient: value
              ? AppGradient.purpleGradient
              : LinearGradient(colors: [
                  AppColors.grayLight,
                  AppColors.grayLight,
                ]),
          borderRadius: BorderRadius.circular(100),
        ),
        width: 36,
        padding: EdgeInsets.all(3),
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        duration: Duration(milliseconds: 200),
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
