import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../widgets/ink_well_wrapper.dart';
import 'widget/widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              _buildAppBar(),
              ProfileSection(),
              DataCardSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          InkWellWrapper(
              onTap: () {
                Navigator.pop(context);
              },
              width: 36,
              height: 36,
              color: AppColors.border,
              borderRadius: BorderRadius.circular(8),
              paddingChild: EdgeInsets.all(8),
              child: Assets.images.svg.icBack.svg(
                width: 16,
                height: 16,
                color: AppColors.black,
              )),
          Expanded(
            child: Text(
              'Profile',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          InkWellWrapper(
            width: 36,
            height: 36,
            color: AppColors.border,
            borderRadius: BorderRadius.circular(8),
            paddingChild: EdgeInsets.symmetric(vertical: 16, horizontal: 13),
            child: Assets.images.svg.icDetails.svg(
              width: 10,
              height: 4,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
