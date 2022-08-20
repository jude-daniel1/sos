import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos/services/http_services.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/v_users/u_terms.dart';
import 'package:sos/widgets/myloading.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _key = new GlobalKey<FormState>();
  bool checked = false;
  bool togglePassword = true;
  late String email, password;

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
              height: 40,
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
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: textColor),
                          controller: _emailTextEditingController,
                          decoration: InputDecoration(
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
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email.trim())) {
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
                                this.togglePassword = !togglePassword;
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
                            loginUser(context);
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
                                      builder: (_) => UserTerms()));
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

  loginUser(BuildContext context) async {
    if (email.isNotEmpty) {
      await userLogin("login", email, password, context);
    }
  }
}
