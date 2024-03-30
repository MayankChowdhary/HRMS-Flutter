import 'package:get/get.dart';

class Dimensions {
  ///Original Screen height - 896

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  ///Dynamic height for padding and margin
  ///140
  static double height5 = screenHeight / 179.2;
  static double height10 = screenHeight / 89.6;
  static double height15 = screenHeight / 59.73;
  static double height20 = screenHeight / 44.8;
  static double height30 = screenHeight / 29.87;
  static double height45 = screenHeight / 19.91;
  static double height40 = screenHeight / 22.4;

  ///Dynamic height for padding and margin
  ///140
  static double width10 = screenHeight / 89.6;
  static double width15 = screenHeight / 59.73;
  static double width20 = screenHeight / 44.8;
  static double width30 = screenHeight / 29.87;
  static double width45 = screenHeight / 19.91;

  ///Dynamic font size
  static double font10 = screenHeight / 89.6;
  static double font12 = screenHeight / 74.67;
  static double font14 = screenHeight / 64;
  static double font16 = screenHeight / 56;
  static double font18 = screenHeight / 49.78;
  static double font20 = screenHeight / 44.8;
  static double font22 = screenHeight / 40.72;
  static double font24 = screenHeight / 37.33;
  static double font26 = screenHeight / 34.46;
  static double font32 = screenHeight / 28;

  ///Dynamic Radius

  static double radius10 = screenHeight / 89.6;
  static double radius15 = screenHeight / 59.73;
  static double radius20 = screenHeight / 44.8;
  static double radius30 = screenHeight / 29.87;

  ///Icon Size
  static double iconsSize50 = screenHeight / 17.92;
  static double iconsSize24 = screenHeight / 37.33;
  static double iconsSize16 = screenHeight / 56;
  static double iconsSize32 = screenHeight / 28.0;
  static double iconsSize28 = screenHeight / 32.0;

  static double splashImageHeight = screenHeight / 2.5;

  static double logoImageWidth = screenHeight / 2.57;

  static double logoImageHeight = screenHeight / 10.54;
}
