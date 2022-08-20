import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sos/services/http_handyman.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/widgets/myloading.dart';

import 'h_message.dart';

// ignore: must_be_immutable
class HandymanStepThree extends StatefulWidget {
  List<String> services;
  String email, name, phone, password, state, lga, address, about;
  HandymanStepThree(
      {required this.services,
      required this.email,
      required this.name,
      required this.phone,
      required this.password,
      required this.state,
      required this.lga,
      required this.address,
      required this.about,
      Key? key})
      : super(key: key);

  @override
  _HandymanStepThreeState createState() => _HandymanStepThreeState();
}

class _HandymanStepThreeState extends State<HandymanStepThree> {
  final GlobalKey<FormState> _key = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String selectedService = "";
  File? imageFile;
  String? imageUrl;

  //start alert style and success
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromLeft,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.red,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    alertAlignment: Alignment.center,
  );

  var alertSuccess = AlertStyle(
    animationType: AnimationType.fromLeft,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.green,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    alertAlignment: Alignment.center,
  );

  void _getFromGallery() async {
    PickedFile? pickedFie = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
    _cropImage(pickedFie!.path);
    Navigator.pop(context);
  }

  void _getFromCamera() async {
    PickedFile? pickedFie = await ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);

    _cropImage(pickedFie!.path);
    Navigator.pop(context);
  }

  void _cropImage(filepath) async {
    File? croppedImage = await await ImageCropper.cropImage(
        sourcePath: filepath, maxHeight: 1080, maxWidth: 1080);
    if (croppedImage != null) {
      setState(() {
        imageFile = croppedImage;
      });
    }
  }

  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Please choose an option"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    _getFromCamera();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(Icons.camera, color: Colors.red),
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _getFromGallery();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(Icons.camera, color: Colors.red),
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/b.jpg"), fit: BoxFit.fill),
          ),
          alignment: Alignment.center,
          child:
              ListView(padding: EdgeInsets.fromLTRB(40, 10, 40, 20), children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    child: Text("1",
                        style: TextStyle(
                          color: textColor,
                        )),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: borderColor)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    child: Text("2",
                        style: TextStyle(
                          color: textColor,
                        )),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: borderColor)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    child: Text("3", style: TextStyle(color: Colors.black)),
                    decoration:
                        BoxDecoration(color: textColor, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            color: arrowColor,
                          ),
                          Text(
                            "Upload Image",
                            style: TextStyle(fontSize: 10, color: textColor),
                          ),
                          Icon(
                            Icons.arrow_downward,
                            color: arrowColor,
                          ),
                        ],
                      )),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                            onTap: () {
                              _showImageDialog();
                            },
                            child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    shape: BoxShape.circle),
                                child: imageFile == null
                                    ? Icon(
                                        Icons.person_add,
                                        size: 50,
                                        color: Colors.white,
                                      )
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            Image.file(imageFile!).image))),
                        SizedBox(
                          height: 40,
                        ),
                        Form(
                          key: _key,
                          child: Column(
                            children: [
                              Theme(
                                  data: Theme.of(context).copyWith(
                                    canvasColor: Colors.black87,
                                  ),
                                  child: DropdownButton<String>(
                                    hint: selectedService == ""
                                        ? Text(
                                            'Choose a serice',
                                            style: TextStyle(color: textColor3),
                                          )
                                        : Text(
                                            selectedService,
                                            style: TextStyle(color: textColor3),
                                          ),
                                    isExpanded: true,
                                    iconSize: 30.0,
                                    items: widget.services.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: textColor3),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        selectedService = val!;
                                      });
                                    },
                                  )),
                              SizedBox(height: 30),
                              InkWell(
                                onTap: () {
                                  if (!_key.currentState!.validate()) {
                                    return;
                                  }
                                  _key.currentState!.save();
                                  registerHandyman();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.white)),
                                  child: Text(
                                    "CREATE ACCOUNT",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }

  void registerHandyman() async {
    if (imageFile == null) {
      Fluttertoast.showToast(
          msg: "Please Select an image",
          backgroundColor: Colors.black,
          textColor: textColor,
          fontSize: 14.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);
    } else if (selectedService.isEmpty ||
        selectedService == "Select a service") {
      Alert(
        style: alertStyle,
        context: context,
        type: AlertType.error,
        title: "Select a Service",
        buttons: [],
      ).show();
      Timer.periodic(Duration(seconds: 3), (timer) {
        Navigator.pop(context);
        timer.cancel();
      });
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return MyProgressDialog(message: "Registering, Please wait...");
          });
      try {
        String filename = imageFile!.path.split('/').last;
        FormData formData = new FormData.fromMap({
          "name": widget.name,
          "email": widget.email,
          "phone": widget.phone,
          "password": widget.password,
          "state": widget.state,
          "lga": widget.lga,
          "address": widget.address,
          "about": widget.about,
          "service": selectedService,
          "image":
              await MultipartFile.fromFile(imageFile!.path, filename: filename),
        });

        Response response = await Dio().post("${baseUrl}hregister",
            data: formData,
            options: Options(contentType: "multipart/form-data"));

        Timer.periodic(Duration(seconds: 5), (timer) async {
          Navigator.pop(context);
          timer.cancel();
          Alert(
            style: alertSuccess,
            context: context,
            type: AlertType.success,
            title: "Registration successful",
            buttons: [],
          ).show();
        });

        Timer.periodic(Duration(seconds: 8), (timer) async {
          Navigator.pop(context);
          timer.cancel();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HandymanMessage()),
              (Route<dynamic> route) => false);
        });
      } catch (e) {
        Navigator.pop(context);
        Alert(
          style: alertStyle,
          context: context,
          type: AlertType.error,
          title: e.toString(),
          buttons: [],
        ).show();
        Timer.periodic(Duration(seconds: 3), (timer) {
          Navigator.pop(context);
          timer.cancel();
        });
      }
    }
  }
}
