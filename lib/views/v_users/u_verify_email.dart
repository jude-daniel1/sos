import 'dart:async';

import 'package:dio/dio.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sos/DialogBox/errorDialog.dart';
import 'package:sos/services/http_services.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/v_users/u_confirm_code.dart';
import 'package:sos/views/v_users/u_login.dart';
import 'package:sos/widgets/myloading.dart';

class UserVerifyEmail extends StatefulWidget {
  UserVerifyEmail({Key? key}) : super(key: key);

  @override
  _UserVerifyEmailState createState() => _UserVerifyEmailState();
}

class _UserVerifyEmailState extends State<UserVerifyEmail> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _key = new GlobalKey<FormState>();
  String? email;

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
                  Text(
                    "Welcome to",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
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
                          keyboardType: TextInputType.emailAddress,
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
                            hintText: "Email",
                            prefixIcon: Container(
                              transform:
                                  Matrix4.translationValues(-15.0, 0.0, 0.0),
                              child: Icon(Icons.email,
                                  size: 18, color: Colors.white),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.trim().isEmpty) {
                              return "Email cannot be empty";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value.trim())) {
                              return "Wrong email format";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String? email) {
                            this.email = email!.trim();
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
                            checkEmail();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.white)),
                            child: Text(
                              "REGISTER WITH EMAIL",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => UserLogin()));
                            },
                            child: Text(
                              "Login >>",
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

  displayDialog(String message) {
    return showDialog(
        context: context,
        builder: (c) => ErrorAlertDialog(
              message: message,
            ));
  }

  checkEmail() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return MyProgressDialog(message: "Sending code, Please wait...");
        });
    try {
      if (email!.isNotEmpty) {
        Response? response = await sendVerificationCode("send_code", email!);
        Navigator.pop(context);
        EasyDialog(
            height: 100,
            closeButton: false,
            title: Text(
              "A confirmation code has been sent to your email",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )).show(context);

        _emailTextEditingController.clear();
        Timer.periodic(Duration(seconds: 5), (timer) {
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => UserConfirmCode(
                      email, response!.data['code'].toString())));
        });
        print(response!.data.toString());
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Unable to connect to network",
            backgroundColor: Colors.white,
            textColor: textColor,
            fontSize: 16.0,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG);
      } else if (e.response!.statusCode == 422) {
        Fluttertoast.showToast(
            msg: "Email already exist",
            backgroundColor: Colors.white,
            textColor: textColor,
            fontSize: 16.0,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG);
      }
    }
  }
}
