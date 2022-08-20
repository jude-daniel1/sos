import 'package:flutter/material.dart';
import 'package:sos/StepTwo.dart';
import 'package:sos/views/v_handyman/h_login.dart';
import 'package:sos/views/v_users/u_login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserLogin()));
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.white70,
                  ),
                  label: Text(
                    "Customer",
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HandymanLogin()));
                  },
                  icon: Icon(
                    Icons.handyman,
                    color: Colors.white70,
                  ),
                  label: Text("Handyman",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontFamily: 'Brand-Regular',
                      ))),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/b.jpg"), fit: BoxFit.fill),
            ),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "S",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 65,
                            fontFamily: 'Brand-Regular'),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white70, width: 6)),
                      child: Container(
                          child: Image.asset(
                        "assets/images/plum.png",
                        width: 40,
                      )),
                    ),
                    Container(
                      child: Text(
                        "S",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 65,
                            fontFamily: 'Brand-Regular'),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    "Handyman Services",
                    style: TextStyle(
                      color: Colors.white60,
                      fontFamily: 'Brand-Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    padding: EdgeInsets.only(top: 140, left: 15, right: 15),
                    alignment: Alignment.center,
                    width: 400,
                    child: Text(
                      "judesos is an online base service platform. As a service provider is to bridge the gap between property owner needing the service of mechanic, electrician, and carpenter etc. with robust distribution network all across Nigeria",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.0,
                          fontFamily: 'Brand-Regular',
                          fontStyle: FontStyle.italic),
                    )),
                SizedBox(
                  height: 100,
                ),
              ],
            )),
      ),
    );
  }
}
