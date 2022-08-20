import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos/config/config.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/widgets/h_widgets/h_drawer.dart';

class HandymanDashboard extends StatefulWidget {
  HandymanDashboard({Key? key}) : super(key: key);

  @override
  _HandymanDashboardState createState() => _HandymanDashboardState();
}

class _HandymanDashboardState extends State<HandymanDashboard> {
  String userImageUrl = "";

  @override
  Widget build(BuildContext context) {
    var isSwitched;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Dashboard",
          style: TextStyle(
              color: textColor, fontSize: 16, fontFamily: 'Brand-Regular'),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage("assets/images/c.jpg"), fit: BoxFit.fill),
          ),
        ),
        // actions: [
        //   Switch(
        //     value: isSwitched,
        //     onChanged: (value) {
        //       setState(() {});
        //     },
        //     activeTrackColor: Colors.lightGreenAccent,
        //     activeColor: Colors.green,
        //   ),
        // ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("assets/images/b.jpg"), fit: BoxFit.fill),
        ),
        padding: EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
        child: ListView(
          children: [
            Center(
                child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "${SOSApp.hUpload}${GetStorage().read("handyman").image}"))),
            SizedBox(height: 15),
            Center(
              child: Text(
                GetStorage().read("handyman").name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Brand-Regular'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  decoration: BoxDecoration(
                      color: transparentColor,
                      border: Border.all(color: borderColor)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1",
                                style: TextStyle(
                                  color: textColor,
                                  fontFamily: fontFamily,
                                  fontSize: 30,
                                ),
                              ),
                              Icon(
                                Icons.pending_actions,
                                color: iconColor,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            "Pending request",
                            style: TextStyle(
                                color: textColor, fontFamily: fontFamily),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 4,
                          decoration: BoxDecoration(color: borderColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  decoration: BoxDecoration(
                      color: transparentColor,
                      border: Border.all(color: borderColor)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "2",
                                style: TextStyle(
                                  color: textColor,
                                  fontFamily: fontFamily,
                                  fontSize: 30,
                                ),
                              ),
                              Icon(
                                Icons.done_all,
                                color: iconColor,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            "Completed request",
                            style: TextStyle(
                                color: textColor, fontFamily: fontFamily),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 4,
                          decoration: BoxDecoration(color: borderColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: (MediaQuery.of(context).size.width / 2) - 20,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: borderColor)),
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 5,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Text(
                        'Available fund',
                        style:
                            TextStyle(color: textColor, fontFamily: fontFamily),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "560000",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 50,
                            ),
                          ),
                          Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white70,
                            size: 70,
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white70)),
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 10),
                      child: Text(
                        "Pay now",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 4,
                      decoration: BoxDecoration(color: borderColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: HandymanDrawer("Dashboard"),
    );
  }
}
