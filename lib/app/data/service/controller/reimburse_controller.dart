import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/core/utils/show_custom_snackbar.dart';
import 'package:employee_attendance_flutter/app/data/model/reimursement_model.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/reimbursement_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../../core/utils/dimensions.dart';
import '../../api/error_handling.dart';
import 'package:path/path.dart';

class ReimburseController extends SuperController {
  static ReimburseController get to => Get.find();

  var emailController = TextEditingController(text: "");
  var upiController = TextEditingController(text: "");
  var totalController = TextEditingController(text: "0");
  var applyDateController = TextEditingController(text: "");
  late TextEditingController dobEditController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final count = 0.obs;
  List<TextEditingController> descEditControllers = [];
  List<TextEditingController> rateEditControllers = [];
  List<TextEditingController> quantityEditControllers = [];
  List<TextEditingController> sumEditControllers = [];
  List<TextEditingController> receiptEditControllers = [];
  final reimburseX = Rxn<List<Reimburse>>();
  final tableData = Rxn<List<List<String>>>([]);
  DateTime selectedDate = DateTime.now();

  var userId = "";
  var attId = "";

  @override
  void onReady() {
    super.onReady();
    addItem();
    getReimbursement();
  }

  @override
  void onDetached() {
    AppUtils.printMessage('DetachInvoked');
  }

  @override
  void onInactive() {
    AppUtils.printMessage('InactiveInvoked');
  }

  @override
  void onPaused() {
    AppUtils.printMessage('PauseInvoked');
  }

  @override
  void onResumed() {
    AppUtils.printMessage('ResumeInvoked');
  }

  void setGrandTotal() {
    double sum = 0;
    for (int i = 0; i < count.value; i++) {
      sum += double.parse(sumEditControllers[i].value.text);
    }
    totalController.text = sum.toString();
    update();
  }

  void setTotal(int index) {
    double rate = 0;
    try {
      rate = double.parse(rateEditControllers[index].text);
    } catch (e) {
      AppUtils.printMessage(e.toString());
    }
    double quantity = 0;
    try {
      quantity = double.parse(quantityEditControllers[index].text);
    } catch (e) {
      AppUtils.printMessage(e.toString());
    }
    sumEditControllers[index].text = (rate * quantity).toString();
    setGrandTotal();
  }

  List<dynamic> getValueArray(List<TextEditingController> editingController) {
    List<dynamic> array = [];
    for (TextEditingController controller in editingController) {
      array.add(controller.text);
    }
    return array;
  }

  void scrollDown() {
    Future.delayed(const Duration(milliseconds: 0), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  String getFilename(String path) {
    if (path.isEmpty) {
      return "No file chosen";
    }
    File file = File(path);
    return basename(file.path);
  }

  void addItem() {
    if(count.value<5) {
      count.value = count.value + 1;
      descEditControllers.add(TextEditingController(text: ""));
      rateEditControllers.add(TextEditingController(text: "0"));
      quantityEditControllers.add(TextEditingController(text: "0"));
      sumEditControllers.add(TextEditingController(text: "0"));
      receiptEditControllers.add(TextEditingController(text: ""));
      update();
      scrollDown();
    }else{
      showCustomSnackBar("Maximum 5 items can be added");
    }
  }

  Future<void> addFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      receiptEditControllers[index].text = result.files.single.path.toString();
      update();
      //File file = File(result.files.single.path.toString());
    }
  }

  void removeItem(int index) {
    if (count.value > 1) {
      descEditControllers.removeAt(index);
      rateEditControllers.removeAt(index);
      quantityEditControllers.removeAt(index);
      sumEditControllers.removeAt(index);
      receiptEditControllers.removeAt(index);
      count.value = count.value - 1;
    }
    update();
    scrollDown();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dobEditController.text =
          "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
    }
  }

  void applyReimbursement() {
    DialogHelper.showLoading();
    try {
      List<dynamic> receiptsPath = getValueArray(receiptEditControllers);
      Map<String, dynamic> body = {
        "userid": userId,
        "descItem": getValueArray(descEditControllers),
        "expense_date": dobEditController.text,
        "rateUnit": getValueArray(rateEditControllers),
        "quantity": getValueArray(quantityEditControllers),
        "total_sum": getValueArray(sumEditControllers),
        "total_amt": totalController.text,
        "email": emailController.text,
        "upi_id": upiController.text,
      };
      ReimbursementRepository().applyReimbursement(receiptsPath, body).then(
          (value) {
        DialogHelper.dismissLoader();
        Get.back();
        Get.snackbar("Reimbursement", "Applied successfully");
      }, onError: (e) {
        DialogHelper.dismissLoader();
        ErrorHandling.handleErrors(e);
      });
    } catch (e) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(e);
      AppUtils.printMessage(e.toString());
    }
  }

  void getReimbursement() async {
    try {
      DialogHelper.showLoading();
      ReimbursementRepository().getReimbursement().then((value) {
        var js = jsonDecode(value);
        ReimburseRoot reimburseRoot = ReimburseRoot.fromJson(js);
        List<Reimburse?>? reimburse = reimburseRoot.data;
        reimburseX.value = reimburse?.cast<Reimburse>();
        getTableData(reimburseX.value);
        DialogHelper.dismissLoader();
      }, onError: (e) {
        DialogHelper.dismissLoader();
        ErrorHandling.handleErrors(e);
      });
    } catch (e) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(e);
    }
  }

  void getTableData(List<Reimburse>? regularization) {
    List<List<String>> tempData = [];
    if (regularization != null) {
      for (var element in regularization) {
        AppUtils.printMessage("Adding items: ${element.email}");
        tempData.add([
          element.id.toString(),
          element.expensedate.toString(),
          element.expenseitem.toString(),
          element.expensecost.toString(),
          element.quantity.toString(),
          element.sum.toString(),
          element.totalamt.toString(),
          element.upiid.toString(),
          element.refno.toString(),
          element.status.toString(),
        ]);
      }
      tableData.value = tempData;
      update();
    }
  }

  String getFormattedString(String raw) {
    final original = raw;
    const find = ',';
    const replaceWith = '\n';
    final newString = original.replaceAll(find, replaceWith);
    return newString;
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
