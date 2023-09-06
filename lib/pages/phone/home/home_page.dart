import 'package:devera_fitness/blocs/activitiy/activity.dart';
import 'package:devera_fitness/pages/pages.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../resources/gradient.dart';
import '../../../resources/shadow.dart';

class HomePage extends StatefulWidget {
  final ActivityBloc activityBloc;

  const HomePage({super.key, required this.activityBloc});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late List<Widget> tabs = [];

  @override
  void initState() {
    super.initState();
    initTabs();
  }

  void initTabs() {
    tabs = [
      HomeTabPage(),
      ActivityTrackerPage(bloc: widget.activityBloc),
      SizedBox(),
      ProgressPhoto(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: tabs,
        index: currentIndex,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
            gradient: AppGradient.blueGradient,
            shape: BoxShape.circle,
            boxShadow: [AppShadow.blueShadow],
          ),
          alignment: Alignment.center,
          child: Icon(Icons.search),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Assets.images.svg.icHome.svg(width: 24, height: 24, color: AppColors.gray),
            selectedIcon: Assets.images.svg.icHomeActive.svg(width: 24, height: 31),
            label: '',
          ),
          NavigationDestination(
            icon: Assets.images.svg.icHomeActivity.svg(width: 24, height: 24, color: AppColors.gray),
            selectedIcon: Assets.images.svg.icActivityActive.svg(width: 24, height: 31),
            label: '',
          ),
          SizedBox(),
          NavigationDestination(
            icon: Assets.images.svg.icCamera.svg(width: 24, height: 24, color: AppColors.gray),
            selectedIcon: Assets.images.svg.icCameraActive.svg(width: 24, height: 31),
            label: '',
          ),
          NavigationDestination(
            icon: Assets.images.svg.icProfile.svg(width: 24, height: 24, color: AppColors.gray),
            selectedIcon: Assets.images.svg.icProfileActive.svg(width: 24, height: 31),
            label: '',
          ),
        ],
        height: 80,
        elevation: 8,
        backgroundColor: AppColors.white,
        indicatorColor: Colors.white,
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          if (index != currentIndex) {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
