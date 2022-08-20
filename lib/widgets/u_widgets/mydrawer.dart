import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos/config/config.dart';
import 'package:sos/request/u_request/user_request.dart';
import 'package:sos/request/u_request/user_save_card.dart';
import 'package:sos/services/http_services.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/home.dart';
import 'package:sos/views/v_services.dart';
import 'package:sos/views/v_users/user_profile.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  final String name;
  MyDrawer(this.name);
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
                          "${SOSApp.upload}${GetStorage().read('user').image}"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "${GetStorage().read('user').name}",
                  style: TextStyle(color: Colors.white),
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
                      Icons.person,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "Services",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "services") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Get.to(() => Services());
                  },
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
                        MaterialPageRoute(builder: (c) => UserProfile());
                    Navigator.push(context, route);
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
                      Icons.home,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "My Requests",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "request") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => UserRequest()));
                  },
                ),
                SizedBox(
                  height: 3,
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
                      Icons.home,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "Receipts",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "receipts") ? Colors.red : Colors.black,
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
                      Icons.cleaning_services,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "Request a Handyman",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "handyman") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {},
                ),
                SizedBox(height: 3),
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
                    "Save Card",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: (name == "card") ? Colors.red : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UserSaveCard()));
                  },
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
                    logout(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void logout(BuildContext context) async {
    try {
      var response = await Dio().post(baseUrl + "logout",
          options: Options(headers: {
            'Authorization': "Bearer ${GetStorage().read('user').token}"
          }));
      print(response.toString());
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false);
    } catch (e) {
      print(e.toString());
    }
  }
}
