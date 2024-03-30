import 'package:employee_attendance_flutter/app/widgets/small_text_widget.dart';
import 'package:flutter/material.dart';
import '../core/colors/colors.dart';
import '../core/utils/dimensions.dart';

class CustomDialog extends StatelessWidget {
  final String message;
  final String? actionName;
  final Function? onOk;
  final Function? onCancel;

  const CustomDialog(
      {super.key, required this.message, this.actionName, this.onOk, this.onCancel});

  // static const double padding = 16.0;
  // static const double avatarRadius = 66.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.height20),
      ),
      elevation: 0.0,
      backgroundColor: AppColors.kTransparentColor,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: Dimensions.height20,
            bottom: Dimensions.height30,
            left: Dimensions.height20,
            right: Dimensions.height20,
          ),
          margin: EdgeInsets.only(bottom: Dimensions.height30 * 2),
          decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Dimensions.height20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: Dimensions.radius10,
                offset: Offset(0.0, Dimensions.width10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              SizedBox(height: Dimensions.height10),
              SmallText(
                text: message,
                size: Dimensions.font16,
              ),
              // Text(
              //   message,
              //   textScaleFactor: 1.0,
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: Dimensions.font16,
              //   ),
              // ),
              SizedBox(height: Dimensions.height10),
            ],
          ),
        ),
        Positioned(
            left: Dimensions.height20,
            right: Dimensions.height20,
            bottom: Dimensions.height30,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: Dimensions.height45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onCancel?.call();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius10),
                            bottomLeft: Radius.circular(Dimensions.radius10),
                          ))),
                      child: SmallText(
                        text: "Cancel",
                        color: AppColors.kWhiteColor,
                        size: Dimensions.font18,
                      ),
                    ),
                  )),
                  Container(
                    color: Colors.white,
                    width: 1,
                    height: Dimensions.height45,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: Dimensions.height45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onOk?.call();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius10),
                              bottomRight: Radius.circular(Dimensions.radius10),
                            ))),
                        child: SmallText(
                          text: actionName ?? "OK",
                          color: AppColors.kWhiteColor,
                          size: Dimensions.font18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
