import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sos/DialogBox/user_cash_payment.dart';
import 'package:sos/config/config.dart';
import 'package:sos/payment/make_payment.dart';
import 'package:sos/request/u_request/user_request.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/widgets/myloading.dart';

// ignore: must_be_immutable
class UserOptionBox extends StatefulWidget {
  BuildContext con;
  int requestId, handymanId;
  UserOptionBox(
      {required this.con, required this.requestId, required this.handymanId});

  @override
  _UserOptionBoxState createState() => _UserOptionBoxState();
}

class _UserOptionBoxState extends State<UserOptionBox> {
  TextEditingController amountController = new TextEditingController();
  int? selected;
  String? value;

  set supliedCode(String supliedCode) {}
  @override
  void initState() {
    // TODO: implement initState
    selected = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 340,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text(
                  'How do you intend to make payment ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Amount"),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RadioListTile(
                  value: 1,
                  groupValue: selected,
                  activeColor: Colors.blue,
                  title: Text(
                    "Pay with your card",
                    style: TextStyle(fontFamily: fontFamily, fontSize: 13),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      selected = val as int?;
                    });
                  }),
              RadioListTile(
                  value: 2,
                  groupValue: selected,
                  activeColor: Colors.green,
                  title: Text(
                    "Pay to handyman",
                    style: TextStyle(fontFamily: fontFamily, fontSize: 13),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      selected = val as int?;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (selected == 1) {
                    Navigator.pop(context);
                    MakePayment(
                            ctx: widget.con,
                            price: int.parse(amountController.text.trim()),
                            requestId: widget.requestId,
                            handymanId: widget.handymanId)
                        .chargeCardAndMakePayment();
                  } else if (selected == 2) {
                    Navigator.pop(context);
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (_) {
                          return UserCashPayment(
                            requestId: widget.requestId,
                            handymanId: widget.handymanId,
                          );
                        });
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: Text("Ok",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getAllRequest(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return MyProgressDialog(message: "Confirming customers claim...");
        });

    try {
      Response response = await Dio().post(
          "http://192.168.43.19:8000/api/handymanConfirmCompleted",
          data: {
            "user_id": SOSApp.sharedPreferences.getInt('id'),
            'handymen_id': widget.handymanId,
            'request_id': widget.requestId,
            'name': value,
            'rating': selected,
            'comment': amountController.text.trim()
          });
      List mylist = [];
      // response.data['data'][0].forEach((k, v) {
      //   mylist.add(v);
      // // })
      Fluttertoast.showToast(
          msg: "Confirmation successfull",
          fontSize: 16.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
      Route route = MaterialPageRoute(builder: (c) => UserRequest());
      Navigator.pushReplacement(context, route);
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          textColor: textColor,
          fontSize: 16.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
