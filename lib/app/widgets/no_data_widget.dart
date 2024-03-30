import 'package:flutter/material.dart';

import '../core/utils/dimensions.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Text(
          "No data found!",
          style: TextStyle(
              fontSize: Dimensions.font18,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ));
  }
}
