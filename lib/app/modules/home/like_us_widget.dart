import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';

class LikeUsWidget extends StatelessWidget {
  const LikeUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Like Us",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Dimensions.font16,
                color: AppColors.kBlackColor)),
        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
          height: 2,
          width: Dimensions.width30,
          decoration: BoxDecoration(
              color: AppColors.kGrayColor,
              borderRadius: BorderRadius.circular(1)),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            _socialIcons("assets/images/tw.png", "https://twitter.com/tysindia"),
            SizedBox(
              width: Dimensions.height10,
            ),

            _socialIcons("assets/images/f.png", "https://www.facebook.com/tysindia"),
            SizedBox(
              width: Dimensions.height10,
            ),

            _socialIcons("assets/images/ins.png", "https://www.instagram.com/tysindia/"),
            SizedBox(
              width: Dimensions.height10,
            ),

            _socialIcons("assets/images/lind.png", "https://www.linkedin.com/company/theyellowstrawberry")
          ],
        ),
      ],
    );
  }

  _socialIcons(String imagePath, String url){
    return GestureDetector(
      onTap:(){
        _launchUrl(url);
      } ,
      child: Image.asset(imagePath,
          width: Dimensions.height30 * 1.2,
          height: Dimensions.height30 * 1.2),
    );

  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(
        Uri.parse(_url
        ),mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_url';
    }
  }


}
