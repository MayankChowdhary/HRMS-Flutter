import 'dart:typed_data';

import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/modules/idcard/id_card_arguments.dart';
import 'package:flutter/material.dart' as mat;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';

import '../../core/utils/app_utils.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/storage_utils.dart';
import '../../data/api/api_path.dart';

Future<Uint8List> makeIDCardPdf(IDCARDArguments idCardData) async {
  final pdf = Document();
  final idCardFrontImage = MemoryImage(
      (await rootBundle.load(APIPath.kIDCardFrontImage)).buffer.asUint8List());
  final idCardBackImage = MemoryImage(
      (await rootBundle.load(APIPath.kIDCardBackImage)).buffer.asUint8List());
  final idCardQRImage = MemoryImage(
      (await rootBundle.load(APIPath.kIDCardQRImage)).buffer.asUint8List());

  final provider = await flutterImageProvider(
      mat.NetworkImage(StorageUtils.instance.getProfilePic()));
  pdf.addPage(
    Page(
      theme: ThemeData.withFont(
        base: await PdfGoogleFonts.varelaRoundRegular(),
        bold: await PdfGoogleFonts.varelaRoundRegular(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
      build: (context) {
        return Container(
          decoration: BoxDecoration(border: Border.all(color: PdfColors.grey)),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image(idCardFrontImage).image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: Dimensions.height45 * 4.5,
                            height: Dimensions.height45 * 4.5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: PdfColor.fromInt(
                                        AppColors.kSecondaryColor.value),
                                    width: 4),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: provider,
                                ))),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(idCardData.firstName ?? "",
                                    style: TextStyle(
                                        fontSize: Dimensions.font32,
                                        fontWeight: FontWeight.bold,
                                        color: PdfColors.white)),
                                SizedBox(
                                  width: Dimensions.height10,
                                ),
                                Text(idCardData.lastName ?? "",
                                    style: TextStyle(
                                        fontSize: Dimensions.font32,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            const PdfColor.fromInt(0xFFFD7E14)))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: FittedBox(
                            child: Text(idCardData.designation ?? "",
                                style: TextStyle(
                                    fontSize: Dimensions.font16,
                                    fontWeight: FontWeight.bold,
                                    color: PdfColors.white)),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height45 * 2.8,
                        ),
                      ],
                    )
                  ])),
              SizedBox(
                height: Dimensions.height30,
              ),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.height40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          const IconData(0xe8e8),
                          color: PdfColor.fromInt(AppColors.kPrimaryDark.value),
                        ),
                        SizedBox(
                          width: Dimensions.height45,
                        ),
                        Text(idCardData.userID ?? "",
                            style: TextStyle(
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.bold,
                                color: PdfColors.black))
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Icon(
                          const IconData(0xe7e9),
                          color: PdfColor.fromInt(AppColors.kPrimaryDark.value),
                        ),
                        SizedBox(
                          width: Dimensions.height45,
                        ),
                        Text(
                            AppUtils.getStandardFormat(
                                AppUtils.getReversedDate("08/02/1998")),
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.normal,
                                color: PdfColors.black))
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Icon(const IconData(0xe92c),
                            color:
                                PdfColor.fromInt(AppColors.kPrimaryDark.value)),
                        SizedBox(
                          width: Dimensions.height45,
                        ),
                        Text(
                            idCardData.gender == "ML"
                                ? "Male"
                                : idCardData.gender == "FL"
                                    ? "Female"
                                    : "NA",
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.normal,
                                color: PdfColors.black)),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Icon(
                          const IconData(0xefe4),
                          color: PdfColor.fromInt(AppColors.kPrimaryDark.value),
                        ),
                        SizedBox(
                          width: Dimensions.height45,
                        ),
                        Text(idCardData.bloodGroup ?? "NA",
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.normal,
                                color: PdfColors.black))
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Icon(
                          const IconData(0xe0cd),
                          color: PdfColor.fromInt(AppColors.kPrimaryDark.value),
                        ),
                        SizedBox(
                          width: Dimensions.height45,
                        ),
                        Text(idCardData.phone ?? "NA",
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.normal,
                                color: PdfColors.black))
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Icon(
                          const IconData(0xe0af),
                          color: PdfColor.fromInt(AppColors.kPrimaryDark.value),
                        ),
                        //mat.Icons.business_c
                        SizedBox(
                          width: Dimensions.height40,
                        ),
                        Text(AppConstants.kCompanyWebPAge,
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.normal,
                                color: PdfColors.black))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    ),
  );
  pdf.addPage(
    Page(
      theme: ThemeData.withFont(
        base: await PdfGoogleFonts.varelaRoundRegular(),
        bold: await PdfGoogleFonts.varelaRoundRegular(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
      build: (context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(color: PdfColors.grey)),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image(idCardBackImage).image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: SizedBox(
                  height: Dimensions.height45 * 10,
                ),
              ),
              SizedBox(height: Dimensions.height45),
              Image(
                idCardQRImage,
                width: Dimensions.height45 * 3,
                height: Dimensions.height45 * 3,
              ),
              SizedBox(height: Dimensions.height45),
              Padding(
                padding: EdgeInsets.all(Dimensions.height10),
                child: Row(
                  children: [
                    Icon(
                      const IconData(0xe0c8),
                      color: PdfColor.fromInt(AppColors.kPrimaryDark.value),
                    ),
                    SizedBox(
                      width: Dimensions.height20,
                    ),
                    Flexible(
                      child: Text(AppConstants.kCompanyAddress,
                          style: TextStyle(
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.normal,
                              color: PdfColors.black)),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    ),
  );
  return pdf.save();
}
