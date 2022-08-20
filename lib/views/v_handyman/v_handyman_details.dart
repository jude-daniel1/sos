import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sos/config/config.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/v_services.dart';
import 'package:sos/widgets/myloading.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HandymanDetails extends StatefulWidget {
  int? service_id;
  int? id;
  double? distance;
  String? title, phone, name, email, image, address, state, lga, about;
  HandymanDetails(
      {this.service_id,
      this.id,
      this.distance,
      this.title,
      this.phone,
      this.name,
      this.email,
      this.image,
      this.address,
      this.state,
      this.lga,
      this.about,
      Key? key})
      : super(key: key);

  @override
  _HandymanDetailsState createState() => _HandymanDetailsState();
}

class _HandymanDetailsState extends State<HandymanDetails> {
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontSize: 15, fontFamily: fontFamily),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 600),
    titleStyle:
        TextStyle(color: Colors.green, fontSize: 18, fontFamily: fontFamily),
    alertAlignment: Alignment.center,
  );
  String userImageUrl = "";
  File? file;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Handyman Details",
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
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 40,
                      backgroundImage:
                          NetworkImage("${SOSApp.hUpload}${widget.image}")),
                ),
                SizedBox(height: 10),
                Text(
                  "${widget.name}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Brand-Regular'),
                ),
                SizedBox(height: 5),
              ],
            ),
            width: width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage("assets/images/k.jpg"), fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 20, right: 10, bottom: 10),
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
                      Icons.email,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "${widget.email}",
                    style:
                        TextStyle(color: Colors.black, fontFamily: fontFamily),
                  ),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.white,
                  thickness: 10.0,
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
                      Icons.phone,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "${widget.phone}",
                    style:
                        TextStyle(color: Colors.black, fontFamily: fontFamily),
                  ),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.white,
                  thickness: 10.0,
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
                      Icons.phone,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    (widget.distance! / 1000).toStringAsFixed(1) +
                        "Km from you",
                    style:
                        TextStyle(color: Colors.black, fontFamily: fontFamily),
                  ),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.white,
                  thickness: 10.0,
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
                      Icons.location_city,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "${widget.state} State",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily),
                  ),
                  onTap: () {
                    // Route route =
                    //     MaterialPageRoute(builder: (c) => UserSignIn());
                    // Navigator.push(context, route);
                  },
                  subtitle: Text(
                    "${widget.lga} Local Government Area",
                    style:
                        TextStyle(color: Colors.black, fontFamily: fontFamily),
                  ),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.white,
                  thickness: 10.0,
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
                      color: textColor,
                    ),
                  ),
                  title: Text(
                    "${widget.address}",
                    style:
                        TextStyle(color: Colors.black, fontFamily: fontFamily),
                  ),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.white,
                  thickness: 10.0,
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
                      Icons.info,
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    "${widget.about}",
                    style:
                        TextStyle(color: Colors.black, fontFamily: fontFamily),
                  ),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.white,
                  thickness: 10.0,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 40,
        child: InkWell(
          onTap: () {
            showConfirmationAlert();
          },
          child: Container(
            alignment: Alignment.center,
            // padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            height: 30,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
            ),
            child: Text(
              "Request Handyman",
              style: TextStyle(
                  color: textColor, fontFamily: fontFamily, fontSize: 15),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("assets/images/c.jpg"), fit: BoxFit.fill),
        ),
      ),
    );
  }

  void showConfirmationAlert() {
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: "REQUEST INFO",
      desc: "Are you sure you want to request for this handyman ?.",
      buttons: [
        DialogButton(
          child: Text(
            "YES",
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          onPressed: () {
            makingRequest(context);
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          color: Colors.red,
          child: Text(
            "NO",
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ).show();
  }

  void makingRequest(BuildContext context) async {
    Navigator.pop(context);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return MyProgressDialog(message: "Sending request, Please wait...");
        });
    try {
      print(GetStorage().read('user').id);
      var response =
          await Dio().post("http://192.168.42.252:8000/api/request", data: {
        "user_id": GetStorage().read('user').id,
        "service_id": widget.service_id,
        "handymen_id": widget.id
      });

      Timer.periodic(Duration(seconds: 2), (timer) {
        Navigator.pop(context);
        print(response);
        if (response.data['data'].toString() != 'yes') {
          Alert(
            context: context,
            style: alertStyle,
            type: AlertType.success,
            title: "",
            desc:
                "You have successfully requested the service of this handyman. Please call or email him/her ${response.data['data']}",
            buttons: [
              DialogButton(
                border: Border.all(width: 2),
                radius: BorderRadius.circular(100),
                child: Icon(Icons.call),
                onPressed: () {
                  _launchCall("${widget.phone}");
                },
                color: Color.fromRGBO(0, 179, 134, 1.0),
              ),
              DialogButton(
                color: Color.fromRGBO(0, 179, 134, 1.0),
                border: Border.all(width: 2),
                radius: BorderRadius.circular(100),
                child: Icon(
                  Icons.mail,
                  color: iconColor,
                ),
                onPressed: () {
                  _launchEmail("${widget.email}");
                },
              ),
              DialogButton(
                color: Color.fromRGBO(0, 179, 134, 1.0),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Services()));
                },
                child: Text(
                  "Continue",
                  style: TextStyle(color: textColor, fontSize: 12),
                ),
              )
            ],
          ).show();
        } else {
          Alert(
            context: context,
            style: alertStyle,
            type: AlertType.error,
            title: "",
            desc:
                'Sorry! you already have a pending request ${response.data['data']}',
            buttons: [
              DialogButton(
                color: Colors.red,
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Ok",
                  style: TextStyle(color: textColor, fontSize: 12),
                ),
              )
            ],
          ).show();
        }
        timer.cancel();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  _launchEmail(String email) async {
    final Uri myurl = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {'subject': 'Booking appointment!'});
    String url = myurl.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchCall(String phone) async {
    var url = "tel:$phone";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
