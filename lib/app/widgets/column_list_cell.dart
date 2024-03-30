import 'package:employee_attendance_flutter/app/widgets/small_text_widget.dart';
import 'package:flutter/cupertino.dart';

import '../core/colors/colors.dart';
import '../core/utils/dimensions.dart';

Widget columnCell(String lbl, dynamic data, String lbl2, dynamic data2) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallText(
                text: lbl,
                size: Dimensions.font12,
                fontWeight: FontWeight.w500,
                color: AppColors.kGrayColor,
              ),
              SizedBox(height: Dimensions.height10),
              SmallText(
                text: '$data',
                size: Dimensions.font14,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SmallText(
                text: lbl2,
                size: Dimensions.font12,
                fontWeight: FontWeight.w500,
                color: AppColors.kGrayColor,
              ),
              SizedBox(height: Dimensions.height10),
              SmallText(
                text: '$data2',
                size: Dimensions.font14,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}