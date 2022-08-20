import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sos/services/http_services.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/v_users/u_login.dart';
import 'package:sos/widgets/myloading.dart';

// ignore: must_be_immutable
class UserRegister extends StatefulWidget {
  String email;
  UserRegister(this.email, {Key? key}) : super(key: key);
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();

  final TextEditingController _phoneTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  final TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _key = new GlobalKey<FormState>();
  String? name, password, confirmPassword, phone;
  // @override
  // void initState() {
  //   super.initState();
  //   this.email = widget.email;
  // }

  bool togglePassword = true;
  bool togglePassword2 = true;

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
          padding: EdgeInsets.only(left: 40, right: 40, top: 10),
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
            Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child:
                        Icon(Icons.person_add, size: 60, color: Colors.white),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: color),
                          controller: _nameTextEditingController,
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Container(
                              transform:
                                  Matrix4.translationValues(-15.0, 0.0, 0.0),
                              child: Icon(
                                Icons.person,
                                size: 18,
                                color: iconColor,
                              ),
                            ),
                            hintText: "Name",
                          ),
                          validator: (String? value) {
                            if (value!.trim().isEmpty) {
                              return "Name cannot be empty";
                            } else if (!RegExp(r'^[a-z A-Z,.\-]+$')
                                .hasMatch(value.trim())) {
                              return "Wrong name format";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String? name) {
                            this.name = name!.trim();
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _phoneTextEditingController,
                          style: TextStyle(color: textColor),
                          keyboardType: TextInputType.number,
                          maxLength: 11,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Phone",
                            prefixIcon: Container(
                              transform:
                                  Matrix4.translationValues(-15.0, 0.0, 0.0),
                              child: Icon(
                                Icons.phone,
                                size: 18,
                                color: iconColor,
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.trim().isEmpty) {
                              return "Phone number cannot be empty";
                            } else if (value.trim().substring(0, 1) != "0") {
                              return "Phone number must start with 0";
                            } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                .hasMatch(value.trim())) {
                              return "Wrong phone number format";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String? phone) {
                            this.phone = phone!.trim();
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          style: TextStyle(color: textColor),
                          controller: _passwordTextEditingController,
                          obscureText: togglePassword,
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Password",
                            prefixIcon: Container(
                              transform:
                                  Matrix4.translationValues(-15.0, 0.0, 0.0),
                              child: Icon(
                                Icons.lock,
                                size: 18,
                                color: iconColor,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                (this.togglePassword == true)
                                    ? this.togglePassword = false
                                    : this.togglePassword = true;
                              },
                              child: Icon(
                                Icons.visibility,
                                color: iconColor,
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.trim().isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.trim().length < 6) {
                              return "Password length must be > 5";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String? password) {
                            this.password = password!.trim();
                          },
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          style: TextStyle(color: textColor),
                          controller: _confirmPasswordTextEditingController,
                          obscureText: togglePassword2,
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Retype Password",
                            prefixIcon: Container(
                              transform:
                                  Matrix4.translationValues(-15.0, 0.0, 0.0),
                              child: Icon(
                                Icons.lock,
                                size: 18,
                                color: iconColor,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                (this.togglePassword2 == true)
                                    ? this.togglePassword2 = false
                                    : this.togglePassword2 = true;
                              },
                              child: Icon(
                                Icons.visibility,
                                color: iconColor,
                              ),
                            ),
                          ),
                          // ignore: missing_return
                          validator: (String? retype) {
                            if (retype!.trim().isEmpty) {
                              return "Password cannot be empty";
                            } else if (_passwordTextEditingController.text !=
                                retype) {
                              return "Both password don't match";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String? password) {
                            this.confirmPassword = password!.trim();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            if (!_key.currentState!.validate()) {
                              return;
                            }
                            _key.currentState!.save();
                            register();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.white)),
                            child: Text(
                              "CREATE ACCOUNT",
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
                              "Register >>",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
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

  Future<void> register() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return MyProgressDialog(message: "Registering, Please wait...");
        });
    try {
      Response? response = await userRegister(
          "register", widget.email, phone!, password!, name!);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        Fluttertoast.showToast(
            msg: "Registration successful, Login",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black26,
            textColor: color,
            fontSize: 16.0);

        Timer.periodic(Duration(seconds: 4), (timer) {
          timer.cancel();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => UserLogin()),
              (Route<dynamic> route) => false);
        });
      }
    } catch (e) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: backgroundColor,
          textColor: textColor,
          fontSize: 16.0);
    }
  }
}
