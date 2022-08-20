import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'views/home.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "SOS Handyman",
        theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.blue),
        home: SplashScreen());
  }

  displayWidget() {}
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  displaySplash() {
    Timer(Duration(seconds: 5), () {
      Route route = MaterialPageRoute(builder: (_) => Home());
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "S",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 85,
                      fontFamily: 'Brand-Regular'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black87,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 7)),
                child: Container(
                    child: Image.asset(
                  "assets/images/plum.png",
                  width: 50,
                )),
              ),
              Container(
                child: Text(
                  "S",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 85,
                      fontFamily: 'Brand-Regular'),
                ),
              )
            ],
          ),
          Center(
            child: Text(
              "Handyman Services",
              style: TextStyle(
                fontFamily: 'Brand-Regular',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Text(
            "Connecting property owners\nwith Technicians/Craftsmen",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
