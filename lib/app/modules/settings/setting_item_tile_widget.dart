import 'package:employee_attendance_flutter/app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SettingTileWidget extends StatelessWidget {
  const SettingTileWidget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Column(
        children: [
          const Divider(
            height: 1,
          ),
          ListTile(
            contentPadding:
                 EdgeInsets.only(left: Dimensions.height20, right:  Dimensions.height20*1.3),
            leading: Icon(icon),
            title: Text(text,
                style: TextStyle(
                    fontSize: Dimensions.font16, fontWeight: FontWeight.w600)),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
