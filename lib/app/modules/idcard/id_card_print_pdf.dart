import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/core/utils/constants.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/id_card_controller.dart';
import 'package:employee_attendance_flutter/app/modules/idcard/id_card_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/storage_utils.dart';
import 'package:printing/printing.dart';

import 'id_card_pdf_export_apge.dart';

class IDCARDPrintPdf extends StatelessWidget {
  IDCARDPrintPdf({Key? key}) : super(key: key);
  IDCARDArguments? args;

  @override
  Widget build(BuildContext context) {
    try {
      args = Get.arguments as IDCARDArguments;
    } catch (e) {
      AppUtils.printMessage(e.toString());
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text("ID-Card Print",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.kMainBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.font20,
              )),
        ),
        elevation: 0,
        backgroundColor: AppColors.kTransparentColor,
      ),
      body: PdfPreview(
        build: (context) => makeIDCardPdf(args!),
      ),
    );
  }
}
