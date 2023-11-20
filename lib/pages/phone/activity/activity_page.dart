import 'package:devera_fitness/blocs/activitiy/activity.dart';
import 'package:devera_fitness/core/base/base.dart';
import 'package:devera_fitness/data/data.dart';
import 'package:flutter/material.dart';

import '../widget/custom_app_bar.dart';
import 'widget/widget.dart';

class ActivityTrackerPage extends StatefulWidget {
  final ActivityBloc bloc;

  const ActivityTrackerPage({super.key, required this.bloc});

  @override
  State<ActivityTrackerPage> createState() => _ActivityTrackerPageState();
}

class _ActivityTrackerPageState extends BaseState<ActivityTrackerPage, ActivityBloc> {
  bool canPop = false;

  @override
  void initState() {
    super.initState();
    bloc.loadData();
  }

  @override
  void onReceivePayload(Object? payload) {
    super.onReceivePayload(payload);
    if (payload == 'canPop' && payload is String) {
      canPop = true;
    }
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
    return CustomAppBar(
      title: 'Activity Tracker',
      hasPopContext: canPop,
    );
  }

  @override
  ActivityBloc get bloc => widget.bloc;
}
