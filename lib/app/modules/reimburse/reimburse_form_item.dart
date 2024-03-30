import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../data/service/controller/reimburse_controller.dart';

class ReimburseItem extends StatelessWidget {
  final ReimburseController controller;
  final int index;

  const ReimburseItem({Key? key, required this.controller, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: AppColors.kGrayDark)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  enabled: true,
                  controller: controller.descEditControllers[index],
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: Dimensions.font16,
                    color: AppColors.kTextFieldColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: const InputDecoration(
                      label: Text(
                        "Description",
                        textAlign: TextAlign.end,
                      ),
                      labelStyle: TextStyle(
                        color: AppColors.kLabelColor,
                      ),
                      prefixIcon: Icon(
                        Icons.description_outlined,
                        color: AppColors.kTextFieldColor,
                      ),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.kTextDividerColor))),
                ),
              ),
              SizedBox(
                width: Dimensions.height45,
              ),
              index >= 1
                  ? SizedBox(
                      width: Dimensions.height45,
                      child: IconButton(
                        icon: const Icon(
                          Icons.remove_circle,
                          color: AppColors.kSecondaryColor,
                        ),
                        iconSize: 30,
                        onPressed: () {
                          controller.removeItem(index);
                        },
                      ),
                    )
                  : Container()
            ],
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Row(
            children: [
              SizedBox(
                width: Dimensions.height10,
              ),
              Expanded(
                child: TextFormField(
                  enabled: true,
                  controller: controller.rateEditControllers[index],
                  maxLines: 1,
                  onChanged: (content) {
                     controller.setTotal(index);
                  },
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: Dimensions.font16,
                    color: AppColors.kTextFieldColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: const InputDecoration(
                      label: Text(
                        "Rate",
                        textAlign: TextAlign.end,
                      ),
                      labelStyle: TextStyle(
                        color: AppColors.kLabelColor,
                      ),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.kTextDividerColor))),
                ),
              ),
              SizedBox(
                width: Dimensions.height10,
              ),
              Expanded(
                child: TextFormField(
                  enabled: true,
                  controller: controller.quantityEditControllers[index],
                  maxLines: 1,
                  onChanged: (content) {
                    controller.setTotal(index);
                  },
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: Dimensions.font16,
                    color: AppColors.kTextFieldColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: const InputDecoration(
                      label: Text(
                        "Quantity",
                        textAlign: TextAlign.end,
                      ),
                      labelStyle: TextStyle(
                        color: AppColors.kLabelColor,
                      ),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.kTextDividerColor))),
                ),
              ),
              SizedBox(
                width: Dimensions.height10,
              ),
              Expanded(
                child: TextFormField(
                  enabled: false,
                  controller: controller.sumEditControllers[index],
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: Dimensions.font16,
                    color: AppColors.kTextFieldColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: const InputDecoration(
                      label: Text(
                        "Sum",
                        textAlign: TextAlign.end,
                      ),
                      labelStyle: TextStyle(
                        color: AppColors.kLabelColor,
                      ),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.kTextDividerColor))),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Receipt",
                    style: TextStyle(
                      fontSize: Dimensions.font16,
                      color: AppColors.kTextFieldColor,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Row(
                  children: [
                    Container(
                      width: Dimensions.height45 * 4,
                      height: Dimensions.height40,
                      padding: const EdgeInsets.all(3.0),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child:  Text(overflow: TextOverflow.ellipsis,
                          controller.getFilename(controller.receiptEditControllers[index].value.text)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kLightGrayColor,
                        minimumSize:
                            Size(Dimensions.height45 * 2, Dimensions.height40),
                      ),
                      onPressed: () {
                        controller.addFile(index);
                      },
                      child: const Text(
                        "Choose File",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.kMainBlackColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
        ],
      ),
    );
  }
}
