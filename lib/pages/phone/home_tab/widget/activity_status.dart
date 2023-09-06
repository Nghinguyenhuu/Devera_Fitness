import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/gradient.dart';
import '../../../../resources/shadow.dart';
import '../../../../router/router.dart';
import '../../../../widgets/gradient_text.dart';

class ActivityStatus extends StatefulWidget {
  const ActivityStatus({super.key});

  @override
  State<ActivityStatus> createState() => _ActivityStatusState();
}

class _ActivityStatusState extends State<ActivityStatus> {
  double waterIntakeMax = 4;

  List<double> subTitle = [0.6, 0.5, 1, 0.7];
  List<int> heartRate = [
    137,
    117,
    91,
    126,
    76,
    136,
    135,
    89,
    81,
    117,
    125,
    101,
    98,
    127,
    146,
    139,
    141,
    113,
    101,
    125,
    142,
    86,
    127,
    143,
    120,
    138,
    131,
    87,
    117,
    96,
    86,
    75,
    132,
    132,
    140,
    137,
    87,
    119,
    114,
    140,
    95,
    138,
    100,
    140,
    114,
    133,
    98,
    120,
    141,
    136,
    85,
    83,
    96,
    107,
    111,
    126,
    103,
    138,
    117,
    84,
    84,
    114,
    93,
    117,
    76,
    104,
    115,
    136,
    130,
    97,
    80,
    125,
    136,
    146,
    148,
    126,
    111,
    132,
    99,
    103,
    92
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Activity Status',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          buildHeartRate(),
          SizedBox(
            height: 315,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildWaterIntake(),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    children: [
                      buildSleep(),
                      SizedBox(height: 15),
                      Flexible(child: buildCalories()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWaterIntake() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        boxShadow: [AppShadow.cardShadow],
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            // fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 20,
                height: 275,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.brandDark,
                      AppColors.secondaryDark,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                width: 20,
                height: 275 * (subTitle.sum / 4),
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Water Intake',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              Text(
                '4 Liters',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  foreground: Paint()
                    ..shader = AppGradient.blueGradient.createShader(
                      Rect.fromLTWH(0, 0, 20, 20),
                    ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Real time updates',
                style: TextStyle(fontSize: 10, height: 1.5, fontWeight: FontWeight.w400, color: AppColors.grayDark),
              ),
              SizedBox(height: 5),
              Column(
                children: [
                  step(title: '6am - 8am', subTitle: '600ml'),
                  step(title: '9am - 11am', subTitle: '500ml'),
                  step(title: '11am - 2pm', subTitle: '1000ml'),
                  step(title: '2pm - 4pm', subTitle: '700ml'),
                  step(title: '4pm - now', subTitle: '900ml', isDottedLine: false, isActive: true),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget step({required String title, required String subTitle, isDottedLine = true, isActive = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                  gradient: isActive
                      ? AppGradient.purpleGradient
                      : LinearGradient(colors: [
                          AppColors.secondaryLight.withOpacity(0.5),
                          AppColors.secondaryDark.withOpacity(0.5),
                        ]),
                  shape: BoxShape.circle,
                  boxShadow: isActive ? [AppShadow.purpleShadow] : null),
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400, color: AppColors.gray),
            ),
          ],
        ),
        SizedBox(height: 3),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 2.5),
              child: isDottedLine
                  ? DottedLine(
                      direction: Axis.vertical,
                      lineLength: 22,
                      dashLength: 2.5,
                      dashGradient: [
                        AppColors.secondaryLight,
                        AppColors.secondaryDark,
                      ],
                      dashGapLength: 2.5,
                    )
                  : SizedBox(width: 1),
            ),
            SizedBox(width: 8),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                foreground: Paint()
                  ..shader = AppGradient.purpleGradient.createShader(
                    Rect.fromLTWH(0, 0, 20, 24),
                  ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSleep() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.sleepTracker);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
          boxShadow: [AppShadow.cardShadow],
        ),
        padding: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sleep',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Text(
              '8h 20m',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                foreground: Paint()
                  ..shader = AppGradient.blueGradient.createShader(
                    Rect.fromLTWH(0, 0, 20, 24),
                  ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(height: 78, child: Assets.images.png.imgSleepGraph.image(fit: BoxFit.cover))
          ],
        ),
      ),
    );
  }

  Widget buildCalories() {
    int maxValue = 760;
    int value = 400;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        boxShadow: [AppShadow.cardShadow],
      ),
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Calories',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          Text(
            '$maxValue kCal',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              foreground: Paint()
                ..shader = AppGradient.blueGradient.createShader(
                  Rect.fromLTWH(0, 0, 20, 24),
                ),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: CustomPaint(
              painter: OutLineCircleCustomPaint(value / maxValue),
              child: Container(
                width: 68,
                decoration: BoxDecoration(gradient: AppGradient.blueGradient, shape: BoxShape.circle, color: Colors.red),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Text(
                  '${value}kCal\nLeft',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildHeartRate() {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            AppColors.brandLight.withOpacity(0.2),
            AppColors.brandDark.withOpacity(0.2),
          ])),
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Heart rate',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                GradientText(
                  '${heartRate.average.ceil()} BPM',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  gradient: AppGradient.blueGradient,
                )
              ],
            ),
          ),
          Expanded(
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                      barWidth: 2,
                      gradient: AppGradient.blueGradient,
                      spots: heartRate
                          .mapIndexed(
                            (index, element) => FlSpot(
                              index.toDouble(),
                              element.toDouble(),
                            ),
                          )
                          .toList(),
                      belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                              colors: [AppColors.white.withOpacity(0), AppColors.brandLight],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                      dotData: FlDotData(show: false))
                ],
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineTouchData: LineTouchData(
                  enabled: true,
                  handleBuiltInTouches: true,
                  getTouchedSpotIndicator: (_, list) {
                    return list
                        .mapIndexed((index, element) => TouchedSpotIndicatorData(
                              FlLine(color: Colors.transparent),
                              FlDotData(getDotPainter: (_, __, ___, ____) {
                                return FlDotCirclePainter(
                                    radius: 2.5, strokeWidth: 2.5, strokeColor: AppColors.secondaryDark, color: AppColors.white);
                              }),
                            ))
                        .toList();
                  },
                  touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: AppColors.secondaryDark,
                      tooltipRoundedRadius: 50,
                      getTooltipItems: (value) {
                        return [
                          LineTooltipItem(
                            '${9 - (value[0].spotIndex / 10).ceil()} mins ago',
                            TextStyle(fontSize: 10, color: AppColors.white),
                          ),
                        ];
                      }),
                ),
                maxX: heartRate.length.toDouble() - 1,
                minX: 0,
                maxY: 150,
                minY: 75,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OutLineCircleCustomPaint extends CustomPainter {
  final double degree;

  OutLineCircleCustomPaint(this.degree);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset(size.width / 2 - 34, 0) & Size(size.height, size.height);
    final shader = LinearGradient(colors: [AppColors.brandDark, AppColors.secondaryDark]).createShader(rect);

    final paint = Paint()
      ..shader = shader
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;
    final paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..color = AppColors.border;

    final path = Path();
    final path1 = Path();

    path.moveTo(size.width / 2, size.height);

    final double start = pi / 2;
    final double value = 2 * pi * degree;

    path.addArc(rect, start, value);
    path1.addArc(rect, 0, 2 * pi);

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
