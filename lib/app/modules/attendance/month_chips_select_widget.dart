import 'package:employee_attendance_flutter/app/data/service/controller/attandence_controller.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';

class MonthChipWidget extends StatelessWidget {
  final AttendanceController controller;

  const MonthChipWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height45 * 1.3,
      width: Dimensions.screenWidth,
      child: ListView(
          controller: controller.scrollController,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: controller.months.map((month) {
            var isSelected = controller.isMonthSelected(month);
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ChoiceChip(
                elevation: isSelected ? 4 : 0,
                label: Text(month),
                labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.kGrayDark,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.font16),
                backgroundColor: Colors.transparent,
                selectedColor: AppColors.kPrimaryDark,
                selected: isSelected,
                onSelected: (bool selected) {
                  controller.setMonthSelection(month);
                },
              ),
            );
          }).toList()),
    );
  }
}
