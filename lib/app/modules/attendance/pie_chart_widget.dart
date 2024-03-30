import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../data/service/controller/attandence_controller.dart';

class PieChartWidget extends StatelessWidget {
  final AttendanceController controller;

  const PieChartWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: controller.chartMap,
      animationDuration: const Duration(milliseconds: 1000),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 2.2,
      colorList: controller.chartColorList,
      initialAngleInDegree: 0,
      chartType: ChartType.disc,
      ringStrokeWidth: 32,
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: false,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold, backgroundColor: Colors.white),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        chartValueStyle: TextStyle(
            color: AppColors.kWhiteColor,
            fontWeight: FontWeight.w500,
            fontSize: Dimensions.font18),
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 0,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}
