import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:flutter/material.dart';

import '../../core/utils/dimensions.dart';

class AddressTextWidget extends StatelessWidget {
  final HomeController controller;

  const AddressTextWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
              size: Dimensions.height20,
            ),
            Text(controller.address.value,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Dimensions.font18,
                    color: Colors.grey)),
          ],
        ),
        Text(
            "Distance from office: ${controller.distanceFromOffice.value.toInt()} metres",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.font12,
                color: Colors.grey)),
      ],
    );
  }
}
