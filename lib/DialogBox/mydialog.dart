import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sos/utils/mycolor.dart';

// ignore: must_be_immutable
class MyDialog extends StatefulWidget {
  int userId, requestId;
  MyDialog({required this.userId, required this.requestId});

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  TextEditingController comment = new TextEditingController();
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
        height: 480,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text(
                  'How would you rate the attitude and support of this customer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              RadioListTile(
                  value: 3,
                  groupValue: selected,
                  activeColor: Colors.green,
                  title: Text(
                    "Great",
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
                    "Good",
                    style: TextStyle(fontFamily: fontFamily, fontSize: 13),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      selected = val as int?;
                    });
                  }),
              RadioListTile(
                  value: 1,
                  groupValue: selected,
                  activeColor: Colors.green,
                  title: Text(
                    "Bad",
                    style: TextStyle(fontFamily: fontFamily, fontSize: 13),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      selected = val as int?;
                    });
                  }),
              RadioListTile(
                  value: 0,
                  groupValue: selected,
                  activeColor: Colors.green,
                  title: Text(
                    "Very Bad",
                    style: TextStyle(fontFamily: fontFamily, fontSize: 13),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      selected = val as int?;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    controller: comment,
                    minLines: 3,
                    maxLines: 4,
                    decoration: InputDecoration(
                        hintText: "Any other comment",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    if (selected == 3) {
                      value = "Great";
                    } else if (selected == 2) {
                      value = "Good";
                    } else if (selected == 1) {
                      value = "Bad";
                    } else {
                      value = "Very Bad";
                    }
                    //getAllRequest(context);
                  },
                  child: Text(
                    "Leave Feedback",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
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
  //           "handymen_id": SOSApp.sharedPreferences.getInt('handymanId'),
  //           'user_id': widget.userId,
  //           'request_id': widget.requestId,
  //           'name': value,
  //           'rating': selected,
  //           'comment': comment.text.trim()
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
