import 'dart:ui';

class AppColors {
  //#
  static const Color kPrimaryColor = Color(0xFFFFC107);
  static const Color kPrimaryDark = Color(0xFFFCAE12);
  static const Color kPrimaryDeep = Color(0xFFFC9801);
  static const Color kSecondaryColor = Color(0xFFFD7E14);
  static const Color kTextColor = Color(0xFF7D7D7D);

  static const Color kWhiteColor = Color(0xFFFFFFFF);
  static const Color kTransparentColor = Color(0x00000000);
  static const Color kRedColor = Color(0xFFDC3545);
  static const Color kBlackColor = Color(0xFF191919);
  static const Color kGrayColor = Color(0xFFa9a29f);
  static const Color kGrayDark = Color(0xFF737171);
  static const Color kGrayControlBack = Color(0xFFDEDEDE);
  static const Color kLabelColor = Color(0xFF737171);
  static const Color kGrayDeem = Color(0xFFF7F7F9);
  static const Color kGrayDeemDark = Color(0xFFF1EFEF);

  static const Color kLightGrayColor = Color(0xFFEDEDED);
  static const Color kLightGrayPlus = Color(0xFFE8E8E8);


  static const Color kIconColor2 = Color(0xFFfcab88);
  static const Color kParaColor = Color(0xFF8f837f);
  static const Color kButtonBackgroundColor = Color(0xFFf7f6f4);
  static const Color kSignColor = Color(0xFFa9a29f);
  static const Color kTitleColor = Color(0xFF5c524f);
  static const Color kMainBlackColor = Color(0xFF332d2b);
  static const Color kTextFieldColor = Color(0xff848484);
  static const Color kTextDividerColor = Color(0xffe1e1e1);
  static const Color kTextBlockColor = Color(0xffae0000);
  static const Color kGreenDark = Color(0xFF0B4E5C);

  static Color gradientFirst = const Color(0xFF1829CA);
  static Color gradientSecond = const Color(0xFFD2292D);
  static Color gradientThird = const Color(0xFFDF214F);
  static Color kChartPresent = const Color(0xFF00A91B);
  static Color kChartAbsent = const Color(0xFFFF0000);
  static Color kChartLate = const Color(0xFFE98713);
  static Color kChartHalfDay = const Color(0xFFA213E9);
  static Color kChartLeave = const Color(0xFF1350E9);

  static Color fromHex(String data)=>Color(int.parse(data.replaceAll('#', '0xff')));

}
