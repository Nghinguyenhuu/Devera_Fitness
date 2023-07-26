import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/gradient.dart';
import '../../../../widgets/app_card_shadow.dart';

class DataCardSection extends StatefulWidget {
  const DataCardSection({super.key});

  @override
  State<DataCardSection> createState() => _DataCardSectionState();
}

class _DataCardSectionState extends State<DataCardSection> {
  @override
  Widget build(BuildContext context) {
    List<DataSectionModel> accountSections = [
      DataSectionModel(icon: Assets.images.svg.icProfileGradient.svg(), text: 'Personal Data'),
      DataSectionModel(icon: Assets.images.svg.icAchievement.svg(), text: 'Achievement'),
      DataSectionModel(icon: Assets.images.svg.icActivity.svg(), text: 'Activity History'),
      DataSectionModel(icon: Assets.images.svg.icWorkout.svg(), text: 'Workout Progress'),
    ];
    List<DataSectionModel> notifySections = [
      DataSectionModel(icon: Assets.images.svg.icNotify.svg(), text: 'Pop-up Notification', isSwitch: true),
    ];
    List<DataSectionModel> otherSections = [
      DataSectionModel(icon: Assets.images.svg.icMessageGradient.svg(), text: 'Contact Us'),
      DataSectionModel(icon: Assets.images.svg.icPolicyGradient.svg(), text: 'Privacy Policy'),
      DataSectionModel(icon: Assets.images.svg.icSetting.svg(), text: 'Settings'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          buildDataCardSection('Account', accountSections),
          SizedBox(height: 15),
          buildDataCardSection('Notification', notifySections),
          SizedBox(height: 15),
          buildDataCardSection('Other', otherSections),
        ],
      ),
    );
  }

  Widget buildDataCardSection(String title, List<DataSectionModel> data) {
    return AppCardShadow(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          ListView.separated(
              itemBuilder: (context, index) {
                return buildDataSectionItem(data[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              shrinkWrap: true,
              itemCount: data.length)
        ],
      ),
    );
  }

  Widget buildDataSectionItem(DataSectionModel data) {
    return Row(
      children: [
        data.icon,
        SizedBox(width: 10),
        Expanded(
          child: Text(
            data.text,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grayDark),
          ),
        ),
        data.isSwitch ? CustomSwitch() : Assets.images.svg.icCheveronRignt.svg(width: 18, height: 18, color: AppColors.grayDark),
      ],
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final bool value;

  const CustomSwitch({super.key, this.value = false});

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

class DataSectionModel extends Equatable {
  final Widget icon;
  final String text;
  final bool isSwitch;

  DataSectionModel({required this.icon, required this.text, this.isSwitch = false});

  @override
  List<Object?> get props => [icon, text, isSwitch];
}
