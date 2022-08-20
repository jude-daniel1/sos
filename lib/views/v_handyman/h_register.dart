import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/v_handyman/h_step_two.dart';

// ignore: must_be_immutable
class HandymanRegister extends StatefulWidget {
  String email;
  HandymanRegister(this.email, {Key? key}) : super(key: key);

  @override
  _HandymanRegisterState createState() => _HandymanRegisterState();
}

class _HandymanRegisterState extends State<HandymanRegister> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _key = new GlobalKey<FormState>();
  bool togglePassword = true;
  bool togglePassword2 = true;
  String name = "";
  String password = "";
  String confirmPassword = "";
  String phone = "";

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
              padding: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    child: Text("1", style: TextStyle(color: Colors.black)),
                    decoration:
                        BoxDecoration(color: textColor, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    child: Text("2",
                        style: TextStyle(
                          color: textColor,
                        )),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: borderColor)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    child: Text("3",
                        style: TextStyle(
                          color: textColor,
                        )),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: borderColor)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: arrowColor,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: arrowColor,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: arrowColor,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: textColor),
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
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            if (!_key.currentState!.validate()) {
                              return;
                            }
                            _key.currentState!.save();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HandymanStepTwo(
                                        email: widget.email,
                                        name: name,
                                        phone: phone,
                                        password: password)));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.white)),
                            child: Text(
                              "NEXT",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
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
}
