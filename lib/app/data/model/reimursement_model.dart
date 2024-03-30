/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Reimburse {
  int? id;
  String? userid;
  String? email;
  String? upiid;
  String? expensedate;
  String? expenseitem;
  String? expensecost;
  String? quantity;
  String? sum;
  String? receipt;
  String? totalamt;
  String? refno;
  String? status;
  String? label;
  String? createdat;
  String? updatedat;

  Reimburse(
      {this.id,
      this.userid,
      this.email,
      this.upiid,
      this.expensedate,
      this.expenseitem,
      this.expensecost,
      this.quantity,
      this.sum,
      this.receipt,
      this.totalamt,
      this.refno,
      this.status,
      this.label,
      this.createdat,
      this.updatedat});

  Reimburse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    email = json['email'];
    upiid = json['upi_id'];
    expensedate = json['expense_date'];
    expenseitem = json['expense_item'];
    expensecost = json['expense_cost'];
    quantity = json['quantity'];
    sum = json['sum'];
    receipt = json['receipt'];
    totalamt = json['total_amt'];
    refno = json['ref_no'];
    status = json['status'];
    label = json['label'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['userid'] = userid;
    data['email'] = email;
    data['upi_id'] = upiid;
    data['expense_date'] = expensedate;
    data['expense_item'] = expenseitem;
    data['expense_cost'] = expensecost;
    data['quantity'] = quantity;
    data['sum'] = sum;
    data['receipt'] = receipt;
    data['total_amt'] = totalamt;
    data['ref_no'] = refno;
    data['status'] = status;
    data['label'] = label;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class ReimburseRoot {
  bool? success;
  int? statuscode;
  List<Reimburse?>? data;
  String? message;

  ReimburseRoot({this.success, this.statuscode, this.data, this.message});

  ReimburseRoot.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statuscode = json['status_code'];
    if (json['data'] != null) {
      data = <Reimburse>[];
      json['data'].forEach((v) {
        data!.add(Reimburse.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['status_code'] = statuscode;
    data['data'] =
        data != null ? this.data!.map((v) => v?.toJson()).toList() : null;
    data['message'] = message;
    return data;
  }
}
