import 'package:flutter/material.dart';

import '../core/utils/dimensions.dart';

class HeaderTitle extends StatelessWidget {
  final String text;

  const HeaderTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(Dimensions.height45, 0, Dimensions.height30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font20)),
            ),
          ),
        ],
      ),
    );
  }
}
