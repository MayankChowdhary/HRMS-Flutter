import 'package:flutter/material.dart';

import '../core/utils/dimensions.dart';

class HeaderHamburgerTitle extends StatelessWidget {
  final String text;

  const HeaderHamburgerTitle({
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
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: Dimensions.height20 * 1.8,
            ),
          ),
        ],
      ),
    );
  }
}
