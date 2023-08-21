import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/gradient.dart';

class WorkoutProgress extends StatefulWidget {
  final bool lightTheme;

  const WorkoutProgress({super.key, this.lightTheme = false});

  @override
  State<WorkoutProgress> createState() => _WorkoutProgressState();
}

class _WorkoutProgressState extends State<WorkoutProgress> {
  List<String> weekDays = const ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  List<double> yValues = const [0, 20, 40, 60, 80, 100];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 30),
        SizedBox(
          height: 180,
          child: LineChart(
            curve: Curves.easeInOutCubic,
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 20),
                    FlSpot(1, 10),
                    FlSpot(2, 40),
                    FlSpot(3, 35),
                    FlSpot(4, 100),
                    FlSpot(5, 34),
                    FlSpot(6, 66),
                  ],
                  dotData: FlDotData(show: false),
                  color: widget.lightTheme ? AppColors.border : null,
                  gradient: widget.lightTheme ? null : AppGradient.blueGradient,
                  isCurved: true,
                ),
                LineChartBarData(
                  spots: [
                    FlSpot(0, 32),
                    FlSpot(1, 54),
                    FlSpot(2, 45),
                    FlSpot(3, 23),
                    FlSpot(4, 65),
                    FlSpot(5, 32),
                    FlSpot(6, 87),
                  ],
                  dotData: FlDotData(show: false),
                  gradient: AppGradient.purpleGradient,
                  isCurved: true,
                ),
              ],
              maxY: 100,
              minY: 0,
              gridData: FlGridData(
                drawVerticalLine: false,
                horizontalInterval: 20,
                getDrawingHorizontalLine: (value) {
                  return FlLine(color: AppColors.grayLight, strokeWidth: 1);
                },
              ),
              borderData: FlBorderData(border: Border.symmetric(horizontal: BorderSide(color: AppColors.grayLight))),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  // axisNameSize: 6,
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 24,
                    getTitlesWidget: (double, title) => bottomTitleWidgets(double, title),
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 20,
                    getTitlesWidget: (double, title) => rightTitleWidgets(double, title),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: widget.lightTheme ? AppColors.white : AppColors.grayDark);
    if (value % 10 != 0) {
      return Container();
    }
    return SideTitleWidget(
      space: 10,
      axisSide: meta.axisSide,
      fitInside: SideTitleFitInsideData.disable(),
      child: Text(
        '${value.toInt()}%',
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: widget.lightTheme ? AppColors.white : AppColors.grayDark);
    if (value % 1 != 0) {
      return Container();
    }
    return SideTitleWidget(
      space: 10,
      axisSide: meta.axisSide,
      fitInside: SideTitleFitInsideData.fromTitleMeta(meta, distanceFromEdge: 0),
      child: Text(
        weekDays[value.toInt()],
        style: style,
      ),
    );
  }
}
