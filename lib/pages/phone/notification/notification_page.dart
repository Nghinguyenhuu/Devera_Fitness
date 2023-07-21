import 'package:flutter/material.dart';

import '../../../blocs/blocs.dart';
import '../../../core/base/base.dart';
import '../../../data/data.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../widgets/ink_well_wrapper.dart';

class NotificationPage extends StatefulWidget {
  final NotificationBloc bloc;

  const NotificationPage({super.key, required this.bloc});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends BaseState<NotificationPage, NotificationBloc> {
  @override
  void initData() {
    bloc.loadData();
    super.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: StreamBuilder<List<ActivityModel>?>(
                  stream: bloc.notificationsStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        itemBuilder: (context, index) {
                          return buildNotificationItem(snapshot.data![index]);
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Divider(
                              color: AppColors.grayLight,
                            ),
                          );
                        },
                        itemCount: snapshot.data!.length,
                      );
                    }
                    return SizedBox();
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
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
              'Notification',
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

  Widget buildNotificationItem(ActivityModel notify) {
    String subTitle = '';

    Duration timeAgo = DateTime.now().difference(notify.date ?? DateTime.now());
    if (timeAgo >= Duration(days: 1)) {
      subTitle = notify.date!.convertDateTimeToString(fromPattern: "dd MMMM");
    } else if (timeAgo >= Duration(hours: 1)) {
      subTitle = 'About ${timeAgo.inHours} hours ago';
    } else if (timeAgo >= Duration(minutes: 1)) {
      subTitle = 'About ${timeAgo.inMinutes} minutes ago';
    } else {
      subTitle = 'Just now';
    }

    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.border,
          ),
          child: Image.asset(
            notify.image ?? '',
            errorBuilder: (_, __, ___) {
              return SizedBox();
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notify.title ?? '',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black),
                ),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.grayDark),
                ),
              ],
            ),
          ),
        ),
        Assets.images.svg.icCardDetails.svg(),
      ],
    );
  }

  @override
  NotificationBloc get bloc => widget.bloc;
}
