import 'package:employee_attendance_flutter/app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SettingTileExpandableWidget extends StatelessWidget {
  const SettingTileExpandableWidget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          leading: Icon(icon),
          title: Text(text,
              style: TextStyle(
                  fontSize: Dimensions.font16, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
