import 'package:flutter/material.dart';
import 'package:sos/utils/mycolor.dart';

// ignore: must_be_immutable
class UserCashPayment extends StatefulWidget {
  int handymanId, requestId;
  UserCashPayment({required this.handymanId, required this.requestId});

  @override
  _UserCashPaymentState createState() => _UserCashPaymentState();
}

class _UserCashPaymentState extends State<UserCashPayment> {
  TextEditingController amount = new TextEditingController();
  int? selected;
  String? value;
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
        height: 220,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            padding: EdgeInsets.only(top: 15),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text(
                  'Complete amount paid to handyman(₦)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: false,
                decoration: InputDecoration(
                    hintText: "Amount",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1))),
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (selected == 1) {
                      } else if (selected == 2) {}
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                        child: Text("Ok",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> getAllRequest(BuildContext context) async {
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return MyProgressDialog(message: "Confirming customers claim...");
  //       });

  //   try {
  //     Response response = await Dio().post(
  //         "http://192.168.43.19:8000/api/handymanConfirmCompleted",
  //         data: {
  //           "handymen_id": judesosApp.sharedPreferences.getInt('handymanId'),
  //           'user_id': widget.userId,
  //           'request_id': widget.requestId,
  //           'name': value,
  //           'rating': selected,
  //           'comment': amount.text.trim()
  //         });
  //     List mylist = [];
  //     // response.data['data'][0].forEach((k, v) {
  //     //   mylist.add(v);
  //     // // })
  //     Fluttertoast.showToast(
  //         msg: "Confirmation successfull",
  //         fontSize: 16.0,
  //         gravity: ToastGravity.BOTTOM,
  //         toastLength: Toast.LENGTH_SHORT);
  //     Route route = MaterialPageRoute(
  //         builder: (c) => HandymanRequest(
  //             pending: response.data['pending'],
  //             progressing: response.data['progressing'],
  //             completed: response.data['completed'],
  //             rejected: response.data['rejected']));
  //     Navigator.pushReplacement(context, route);
  //   } on DioError catch (e) {
  //     Fluttertoast.showToast(
  //         msg: e.toString(),
  //         textColor: textColor,
  //         fontSize: 16.0,
  //         gravity: ToastGravity.BOTTOM,
  //         toastLength: Toast.LENGTH_LONG);
  //   }
  // }
}
