import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sos/services/http_services.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/v_handyman/h_register.dart';
import 'package:sos/views/v_users/u_register.dart';
import 'package:sos/widgets/myloading.dart';

// ignore: must_be_immutable
class HandymanConfirmCode extends StatefulWidget {
  late String email, code;
  HandymanConfirmCode(this.email, this.code, {Key? key}) : super(key: key);

  @override
  _HandymanConfirmCodeState createState() => _HandymanConfirmCodeState();
}

class _HandymanConfirmCodeState extends State<HandymanConfirmCode> {
  final TextEditingController _codeTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _key = new GlobalKey<FormState>();
  String? supliedCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/b.jpg"), fit: BoxFit.fill),
        ),
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.only(left: 40, right: 40, top: 30),
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Welcome to",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "SOS",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Handyman Services",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "(Register as Handyman)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 120),
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    child: Icon(Icons.alternate_email,
                        size: 70, color: Colors.white),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: textColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            helperStyle: TextStyle(color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Verification Code",
                            prefixIcon: Container(
                              transform:
                                  Matrix4.translationValues(-15.0, 0.0, 0.0),
                              child: Icon(Icons.email,
                                  size: 18, color: Colors.white),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.trim().isEmpty) {
                              return "Code cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String? code) {
                            this.supliedCode = code!.trim();
                          },
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        InkWell(
                          onTap: () {
                            if (!_key.currentState!.validate()) {
                              return;
                            }
                            _key.currentState!.save();
                            compareCode();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.white)),
                            child: Text(
                              "CHECK CODE",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextButton(
                            onPressed: () {
                              resendCode();
                            },
                            child: Text(
                              "Resend Code >>",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  resendCode() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return MyProgressDialog(message: "Resending code, Please wait...");
        });
    try {
      var response = await sendVerificationCode("hsend_code", widget.email);
      widget.code = response!.data['code'].toString();

      Timer.periodic(Duration(seconds: 4), (timer) async {
        Navigator.pop(context);
        timer.cancel();
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.white,
          textColor: textColor,
          fontSize: 16.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG);
    }
  }

  compareCode() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return MyProgressDialog(message: "Checking code, Please wait...");
        });
    Timer.periodic(Duration(seconds: 3), (mytimer) {
      Navigator.pop(context);
      mytimer.cancel();
      if (widget.code == supliedCode) {
        _codeTextEditingController.clear();
        var alertStyle = AlertStyle(
          animationType: AnimationType.fromLeft,
          isCloseButton: false,
          isOverlayTapDismiss: false,
          descStyle: TextStyle(fontWeight: FontWeight.bold),
          descTextAlign: TextAlign.start,
          animationDuration: Duration(milliseconds: 600),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.green,
            ),
          ),
          titleStyle: TextStyle(
            color: Colors.green,
          ),
          alertAlignment: Alignment.center,
        );

        Alert(
          style: alertStyle,
          context: context,
          type: AlertType.success,
          title: "Code is Correct",
          buttons: [],
        ).show();
        Timer.periodic(Duration(seconds: 3), (timer) {
          Navigator.pop(context);
          timer.cancel();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => HandymanRegister(widget.email)));
        });
      } else {
        _codeTextEditingController.clear();
        var alertStyle = AlertStyle(
          animationType: AnimationType.fromLeft,
          isCloseButton: false,
          isOverlayTapDismiss: false,
          descStyle: TextStyle(fontWeight: FontWeight.bold),
          descTextAlign: TextAlign.start,
          animationDuration: Duration(milliseconds: 400),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.red,
            ),
          ),
          titleStyle: TextStyle(
            color: Colors.red,
          ),
          alertAlignment: Alignment.center,
        );
        Alert(
          style: alertStyle,
          context: context,
          type: AlertType.error,
          title: "Code is Wrong",
          buttons: [],
        ).show();
        Timer.periodic(Duration(seconds: 3), (timer) {
          Navigator.pop(context);
          timer.cancel();
        });
      }
    });
  }
}
