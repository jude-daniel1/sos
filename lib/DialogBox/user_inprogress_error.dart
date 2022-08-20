import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/widgets/myloading.dart';

// ignore: must_be_immutable
class UserInProgressError extends StatefulWidget {
  int requestId;
  UserInProgressError({required this.requestId});

  @override
  _UserInProgressErrorState createState() => _UserInProgressErrorState();
}

class _UserInProgressErrorState extends State<UserInProgressError> {
  TextEditingController comment = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 290,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text(
                  "What is your complain about this handyman",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    controller: comment,
                    minLines: 5,
                    maxLines: 7,
                    decoration: InputDecoration(
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
                    userReportIssues(context);
                  },
                  child: Text(
                    "Report issues",
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

  Future<void> userReportIssues(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return MyProgressDialog(message: "Reporting issues...");
        });

    try {
      Response response = await Dio()
          .post("http://192.168.43.19:8000/api/userReport", data: {
        'request_id': widget.requestId,
        'comment': comment.text.trim()
      });
      Fluttertoast.showToast(
          msg: "Report submitted successfully",
          fontSize: 16.0,
          backgroundColor: Colors.brown,
          textColor: textColor,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
      Navigator.pop(context);
      Navigator.pop(context);
    } on DioError catch (e) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: e.toString(),
          textColor: textColor,
          backgroundColor: Colors.brown,
          fontSize: 16.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
