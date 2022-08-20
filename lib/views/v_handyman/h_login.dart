import 'package:flutter/material.dart';
import 'package:sos/services/http_handyman.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/v_handyman/h_terms.dart';

// ignore: must_be_immutable
class HandymanLogin extends StatelessWidget {
  final TextEditingController _codeTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _key = new GlobalKey<FormState>();
  bool checked = false;
  bool togglePassword = true;
  late String code, password;

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
          padding: EdgeInsets.only(left: 40, right: 40, top: 20),
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
                        fontSize: 36,
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
                    "(Login as Handyman)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(Icons.login_outlined,
                        size: 80, color: Colors.white),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: textColor),
                          controller: _codeTextEditingController,
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Code",
                            prefixIcon: Container(
                              transform:
                                  Matrix4.translationValues(-15.0, 0.0, 0.0),
                              child: Icon(
                                Icons.email,
                                size: 18,
                                color: iconColor,
                              ),
                            ),
                          ),
                          validator: (String? email) {
                            if (email!.trim().isEmpty) {
                              return "Email cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String? code) {
                            this.code = code!.trim();
                          },
                        ),
                        SizedBox(
                          height: 5,
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
                              child:
                                  Icon(Icons.lock, size: 18, color: iconColor),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                (this.togglePassword == true)
                                    ? this.togglePassword = false
                                    : this.togglePassword = true;
                              },
                              child:
                                  Icon(Icons.visibility, color: Colors.white),
                            ),
                          ),
                          validator: (String? password) {
                            if (password!.trim().isEmpty) {
                              return "Password field cannot be empty";
                            }
                            return null;
                          },
                          onSaved: (String? password) {
                            this.password = password!;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            if (!_key.currentState!.validate()) {
                              return;
                            }
                            _key.currentState!.save();
                            loginHandyman(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.white)),
                            child: Text(
                              "LOGIN",
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
                                      builder: (_) => HandymanTerms()));
                            },
                            child: Text(
                              "Register >",
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

  loginHandyman(BuildContext context) async {
    if (code.isNotEmpty) {
      await handymanLogin("hlogin", code, password, context);
    }
  }
}
