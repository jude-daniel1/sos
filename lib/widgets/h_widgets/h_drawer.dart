import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos/config/config.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/home.dart';
import 'package:sos/views/v_handyman/h_dashboard.dart';
import 'package:sos/views/v_handyman/h_login.dart';

class HandymanDrawer extends StatelessWidget {
  final String name;
  HandymanDrawer(this.name);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/c.jpg"), fit: BoxFit.fill),
            ),
            padding: EdgeInsets.only(top: 25.0, bottom: 5.0),
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                  elevation: 8.0,
                  child: Container(
                    color: Colors.transparent,
                    height: 100.0,
                    width: 100.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "${SOSApp.hUpload}${GetStorage().read('handyman').image}"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  GetStorage().read("handyman").name,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(top: 1.0),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/icon.jpg"),
                          fit: BoxFit.fill),
                    ),
                    child: Icon(
                      Icons.dashboard,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "Dashboard",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "Dashboard") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (c) => HandymanDashboard());
                    Navigator.push(context, route);
                  },
                ),
                SizedBox(
                  height: 3,
                ),
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/icon.jpg"),
                          fit: BoxFit.fill),
                    ),
                    child: Icon(
                      Icons.person,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "My Profie",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "profile") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (c) => HandymanLogin());
                    Navigator.pushReplacement(context, route);
                  },
                ),
                SizedBox(
                  height: 3,
                ),
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/icon.jpg"),
                          fit: BoxFit.fill),
                    ),
                    child: Icon(
                      Icons.home,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "My Requests",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "Request") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 3,
                ),
                ListTile(
                  // leading: Icon(Icons.home,
                  //     color: (name == "orders") ? Colors.red : Colors.black),
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/icon.jpg"),
                          fit: BoxFit.fill),
                    ),
                    child: Icon(
                      Icons.save,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "Save Card",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "card") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 3,
                ),
                ListTile(
                  // leading: Icon(Icons.home,
                  //     color: (name == "orders") ? Colors.red : Colors.black),
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/icon.jpg"),
                          fit: BoxFit.fill),
                    ),
                    child: Icon(
                      Icons.save,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "History",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "history") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 3,
                ),
                SizedBox(
                  height: 3,
                ),
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/icon.jpg"),
                          fit: BoxFit.fill),
                    ),
                    child: Icon(
                      Icons.new_releases,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "News",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "news") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (c) => HandymanLogin());
                    Navigator.pushReplacement(context, route);
                  },
                ),
                SizedBox(
                  height: 3,
                ),
                ListTile(
                  // leading: Icon(Icons.home,
                  //     color: (name == "orders") ? Colors.red : Colors.black),
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/icon.jpg"),
                          fit: BoxFit.fill),
                    ),
                    child: Icon(
                      Icons.payment,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "My Wallet",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "wallet") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 3,
                ),
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/icon.jpg"),
                          fit: BoxFit.fill),
                    ),
                    child: Icon(
                      Icons.handyman,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "Rate Our App",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "rate") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 3,
                ),
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/icon.jpg"),
                          fit: BoxFit.fill),
                    ),
                    child: Icon(
                      Icons.logout,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "Logout",
                    style:
                        TextStyle(fontFamily: fontFamily, color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Home()),
                        (Route<dynamic> route) => false);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
