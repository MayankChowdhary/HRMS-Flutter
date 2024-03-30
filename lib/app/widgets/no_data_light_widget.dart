import 'package:flutter/material.dart';

import '../core/colors/colors.dart';
import '../core/utils/dimensions.dart';

class NoDataLightWidget extends StatelessWidget {
  const NoDataLightWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No Data Found",
        style:
            TextStyle(fontWeight: FontWeight.w600, color: AppColors.kTextColor),
      ),
    );
  }
}
