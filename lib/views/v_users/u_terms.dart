import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/home.dart';
import 'package:sos/views/v_users/u_register.dart';
import 'package:sos/views/v_users/u_verify_email.dart';

class UserTerms extends StatelessWidget {
  const UserTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SOS",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    "CUSTOMERS TERMS & CONDITIONS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
            ),
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/c.jpg"), fit: BoxFit.fill),
            ),
          ),
          Expanded(
              flex: 90,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "In the nearest future, we will ensure that we create a wide range of distribution channels all across Nigeria, the West African Coats and the World at large. With that, we know we will be able to maximize profits in our business.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "In the nearest future, we will ensure that we create a wide range of distribution channels all across Nigeria, the West African Coats and the World at large. With that, we know we will be able to maximize profits in our business.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "In the nearest future, we will ensure that we create a wide range of distribution channels all across Nigeria, the West African Coats and the World at large. With that, we know we will be able to maximize profits in our business.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "In the nearest future, we will ensure that we create a wide range of distribution channels all across Nigeria, the West African Coats and the World at large. With that, we know we will be able to maximize profits in our business.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "In the nearest future, we will ensure that we create a wide range of distribution channels all across Nigeria, the West African Coats and the World at large. With that, we know we will be able to maximize profits in our business.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "In the nearest future, we will ensure that we create a wide range of distribution channels all across Nigeria, the West African Coats and the World at large. With that, we know we will be able to maximize profits in our business.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "In the nearest future, we will ensure that we create a wide range of distribution channels all across Nigeria, the West African Coats and the World at large. With that, we know we will be able to maximize profits in our business.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "In the nearest future, we will ensure that we create a wide range of distribution channels all across Nigeria, the West African Coats and the World at large. With that, we know we will be able to maximize profits in our business.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "In the nearest future, we will ensure that we create a wide range of distribution channels all across Nigeria, the West African Coats and the World at large. With that, we know we will be able to maximize profits in our business.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "In the nearest future, we will ensure that we create a wide range of distribution channels all across Nigeria, the West African Coats and the World at large. With that, we know we will be able to maximize profits in our business.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      "In the nearest future, we will ensure that we create a wide range of distribution channels all across Nigeria, the West African Coats and the World at large. With that, we know we will be able to maximize profits in our business.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  )
                ],
              )),
        ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("assets/images/c.jpg"), fit: BoxFit.fill),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 50,
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserVerifyEmail()));
                  },
                  icon: Icon(
                    Icons.thumb_up,
                    color: Colors.white70,
                  ),
                  label: Text(
                    "Accept",
                    style: TextStyle(
                        fontFamily: 'Brand-Regular',
                        color: Colors.white70,
                        fontSize: 18),
                  )),
            ),
            Expanded(
              flex: 50,
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white70,
                  ),
                  label: Text("Cancel",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontFamily: 'Brand-Regular',
                      ))),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
