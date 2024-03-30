import 'package:employee_attendance_flutter/app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SettingTileExpandedWidget extends StatelessWidget {
  const SettingTileExpandedWidget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: Column(
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            leading: Icon(icon),
            title: Text(text,
                style: TextStyle(
                    fontSize: Dimensions.font16, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
