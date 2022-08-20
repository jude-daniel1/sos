import 'package:flutter/material.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/home.dart';
import 'package:sos/views/v_handyman/h_login.dart';

class HandymanMessage extends StatefulWidget {
  HandymanMessage({Key? key}) : super(key: key);

  @override
  _HandymanMessageState createState() => _HandymanMessageState();
}

class _HandymanMessageState extends State<HandymanMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Notification",
            style: TextStyle(
                color: textColor, fontFamily: fontFamily, fontSize: 18),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage("assets/images/c.jpg"), fit: BoxFit.fill),
            ),
          )),
      body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/b.jpg"), fit: BoxFit.fill),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.check,
                  color: iconColor,
                  size: 150,
                ),
              ),
              Center(
                child: Text(
                  "Registration Successfully",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontFamily,
                      color: textColor),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "A mail has been sent to your email, please kindly proceed to the address contained in the email for physical verificiation. After which your handyman code will be sent to you, this is the code you need to login into your account",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 14, color: textColor, fontFamily: fontFamily),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: FlatButton.icon(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => Home()));
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Back to home",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: fontFamily),
                    )),
              )
            ],
          )),
    );
  }
}
