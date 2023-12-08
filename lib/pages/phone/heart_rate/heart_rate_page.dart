import 'package:devera_fitness/extensions/extensions.dart';
import 'package:devera_fitness/pages/pages.dart';
import 'package:devera_fitness/pages/phone/heart_rate/heart_rate_progress.dart';
import 'package:devera_fitness/widgets/app_card_shadow.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../data/models/heart_rate_model.dart';
import '../../../resources/colors.dart';
import '../../../resources/gradient.dart';
import '../../../widgets/gradient_text.dart';
import '../widget/custom_app_bar.dart';

class HeartRatePage extends StatefulWidget {
  List<HeartRateModel>? heartRates;

  HeartRatePage({super.key, this.heartRates});

  @override
  State<HeartRatePage> createState() => _HeartRatePageState();
}

class _HeartRatePageState extends State<HeartRatePage> {
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
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(
                title: 'Heart Rate',
              ),
              SizedBox(height: 15),
              // HeartRateProgress(),
              buildGraphSection(),
              AppHeader(title: 'Latest Activity'),
              SizedBox(height: 8),
              ...List.generate(widget.heartRates?.length ?? 0, (index) => buildHeartRateItem(widget.heartRates![index])),
              WantToTrain(),
            ],
          ),
        ),
      ),
    );
  }

  buildHeartRateItem(HeartRateModel heartRate) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            AppColors.brandLight.withOpacity(0.2),
            AppColors.brandDark.withOpacity(0.2),
          ])),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientText(
                    '${heartRate.averRate ?? 0} BPM',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    gradient: AppGradient.blueGradient,
                  ),
                  buildTime(heartRate.time),
                ],
              ),
              Row(
                children: [],
              )
            ],
          ),
        ],
      ),
    );
  }

  buildTime(String? time) {
    if (time != null) {
      try {
        var _time = time.convertToDateTime(fromPattern: 'hh:mm:ss dd/MM/yyyy');
        return GradientText(
          _time.convertDateTimeToString(fromPattern: 'dd, MMMM yyyy'),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          gradient: AppGradient.purpleGradient,
        );
      } catch (e) {
        print(e);
      }
    }
    return SizedBox();
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
                      reservedSize: 36,
                      interval: 2,
                      getTitlesWidget: (value, titleData) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            '${(value * 10 + 60).round()}',
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
}
