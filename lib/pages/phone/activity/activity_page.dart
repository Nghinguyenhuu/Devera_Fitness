import 'package:devera_fitness/blocs/activitiy/activity.dart';
import 'package:devera_fitness/core/base/base.dart';
import 'package:devera_fitness/data/data.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../widgets/ink_well_wrapper.dart';
import 'widget/widget.dart';

class ActivityTrackerPage extends StatefulWidget {
  final ActivityBloc bloc;

  const ActivityTrackerPage({super.key, required this.bloc});

  @override
  State<ActivityTrackerPage> createState() => _ActivityTrackerPageState();
}

class _ActivityTrackerPageState extends BaseState<ActivityTrackerPage, ActivityBloc> {
  @override
  void initState() {
    super.initState();
    bloc.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              _buildAppBar(),
              TodayTarget(),
              ActivityProgress(),
              StreamBuilder<List<ActivityModel>?>(
                  stream: bloc.activitiesStream,
                  builder: (context, snapshot) {
                    return LatestActivity(
                      activities: snapshot.data,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
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
              'Activity Tracker',
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

  @override
  ActivityBloc get bloc => widget.bloc;
}
