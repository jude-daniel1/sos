import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyProgressDialog extends StatelessWidget {
  var color = const Color(0xff75022d);
  String message;
  MyProgressDialog({required this.message});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            image: DecorationImage(
                image: AssetImage("assets/images/c.jpg"), fit: BoxFit.fill),
          ),
          margin: EdgeInsets.all(6.0),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                SizedBox(
                  width: 6.0,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                SizedBox(
                  width: 26.0,
                ),
                Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 10.0),
                ),
              ],
            ),
          )),
    );
  }
}
