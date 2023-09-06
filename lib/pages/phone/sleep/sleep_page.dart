import 'package:devera_fitness/pages/pages.dart';
import 'package:devera_fitness/widgets/app_button.dart';
import 'package:devera_fitness/widgets/app_card_shadow.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import '../../../resources/gradient.dart';

class SleepTrackerPage extends StatefulWidget {
  const SleepTrackerPage({super.key});

  @override
  State<SleepTrackerPage> createState() => _SleepTrackerPageState();
}

class _SleepTrackerPageState extends State<SleepTrackerPage> {
  var days = {
    1: "Sun",
    2: "Mon",
    3: "Tue",
    4: "Wed",
    5: "Thu",
    6: "Fri",
    7: "Sat",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            children: [
              CustomAppBar(title: 'Sleep Tracker'),
              SizedBox(height: 15),
              buildGraphSection(),
              buildBanner(),
              buildTodaySchedule(),
            ],
          ),
        ),
      ),
    );
  }

  buildGraphSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        height: 180,
        child: LineChart(
          LineChartData(
              lineBarsData: [
                LineChartBarData(
                    spots: [
                      FlSpot(0.5, 3),
                      FlSpot(1, 4),
                      FlSpot(2, 3),
                      FlSpot(3, 5),
                      FlSpot(4, 4),
                      FlSpot(5, 6),
                      FlSpot(6, 5.5),
                      FlSpot(7, 7),
                      FlSpot(7.5, 8),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        AppColors.brandLight,
                        AppColors.brandDark,
                      ],
                    ),
                    isCurved: true,
                    curveSmoothness: 0.4,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(colors: [
                          AppColors.brandDark,
                          AppColors.white,
                        ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
              ],
              gridData: FlGridData(
                  drawVerticalLine: false,
                  horizontalInterval: 2,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(strokeWidth: 1, color: AppColors.gray);
                  }),
              minY: 0,
              maxY: 10,
              minX: 0.5,
              maxX: 7.5,
              titlesData: FlTitlesData(
                topTitles: AxisTitles(drawBelowEverything: false),
                leftTitles: AxisTitles(drawBelowEverything: false),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      interval: 2,
                      getTitlesWidget: (value, titleData) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            '${value}h',
                            style: TextStyle(fontSize: 12, height: 1.5, color: AppColors.grayDark),
                          ),
                        );
                      }),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 48,
                      getTitlesWidget: (value, titleData) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            days[value] ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              color: AppColors.grayDark,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }),
                ),
              ),
              borderData: FlBorderData(
                border: Border(top: BorderSide(color: AppColors.gray)),
              ),
              lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                      tooltipRoundedRadius: 8,
                      tooltipBgColor: AppColors.white,
                      fitInsideVertically: false,
                      getTooltipItems: (lineBarSpots) {
                        return lineBarSpots.map((e) {
                          var value = e.y * 10;
                          return LineTooltipItem(
                            ' ${value}% increase',
                            TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.success),
                          );
                        }).toList();
                      }),
                  getTouchedSpotIndicator: (lineBarData, listValue) {
                    return listValue
                        .map((e) => TouchedSpotIndicatorData(
                              FlLine(strokeWidth: 2, dashArray: [2], color: AppColors.brandLight),
                              FlDotData(getDotPainter: (_, __, ___, ____) {
                                return DotPainter();
                              }),
                            ))
                        .toList();
                  })),
        ),
      ),
    );
  }

  buildTodaySchedule() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          AppHeader(title: 'Today Schedule'),
          SizedBox(height: 15),
          AppCardShadow(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Assets.images.svg.icCalendar.svg(width: 30, height: 30, color: AppColors.grayDark),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bedtime, 09:00pm',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'in 6hours 22minutes',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.grayDark),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [Assets.images.svg.icCardDetails.svg(), SizedBox(height: 20), CustomSwitch()],
                    ),
                  )
                ],
              )),
          SizedBox(height: 15),
          AppCardShadow(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Assets.images.svg.icCalendar.svg(width: 30, height: 30, color: AppColors.grayDark),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alarm, 05:10am',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'in 14hours 30minutes',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.grayDark),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Assets.images.svg.icCardDetails.svg(),
                        SizedBox(height: 20),
                        CustomSwitch(),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  buildBanner() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), gradient: AppGradient.blueGradient, color: AppColors.white.withOpacity(0.2)),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Daily Sleep Schedule',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          AppButton(
              borderRadius: BorderRadius.circular(50),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Text(
                'check',
                style: TextStyle(fontSize: 12, color: AppColors.white),
              ))
        ],
      ),
    );
  }
}

class DotPainter extends FlDotPainter {
  @override
  void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas) {
    final paint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;
    final paintStroke = Paint()
      ..strokeWidth = 2
      ..color = AppColors.brandDark
      ..style = PaintingStyle.stroke;
    canvas.drawOval(Rect.fromCenter(center: offsetInCanvas, width: 10, height: 10), paint);
    canvas.drawOval(Rect.fromCenter(center: offsetInCanvas, width: 10, height: 10), paintStroke);
  }

  @override
  Size getSize(FlSpot spot) {
    return Size(10, 10);
  }

  @override
  List<Object?> get props => [];
}
