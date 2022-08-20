import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos/config/config.dart';
import 'package:sos/services/http_handyman.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/widgets/u_widgets/mydrawer.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? imageUrl;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "User Profile",
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
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () => takeImage(context),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "${SOSApp.upload}${GetStorage().read("user").image}",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  GetStorage().read("user").name,
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
                    GetStorage().read("user").email,
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    // Route route =
                    //     MaterialPageRoute(builder: (c) => UserSignIn());
                    // Navigator.push(context, route);
                  },
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
                    GetStorage().read("user").phone,
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    // Route route =
                    //     MaterialPageRoute(builder: (c) => UserSignIn());
                    // Navigator.push(context, route);
                  },
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
                    GetStorage().read("user").state + " State",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    // Route route =
                    //     MaterialPageRoute(builder: (c) => UserSignIn());
                    // Navigator.push(context, route);
                  },
                  subtitle: Text(
                    GetStorage().read("user").lga + " Local Government Area",
                    style: TextStyle(color: Colors.black),
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
                      color: iconColor,
                    ),
                  ),
                  title: Text(
                    GetStorage().read("user").address,
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    // Route route =
                    //     MaterialPageRoute(builder: (c) => UserSignIn());
                    // Navigator.push(context, route);
                  },
                ),
              ],
            ),
          )
        ],
      ),

      drawer: MyDrawer("profile"),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("assets/images/c.jpg"), fit: BoxFit.fill),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {},
          tooltip: 'Edit Profile',
          child: Icon(
            Icons.edit,
            color: iconColor,
          ),
        ),
      ), // This trailing comma ma
    );
  }

  takeImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (con) {
          return SimpleDialog(
            title: Text(
              "Item Image",
              style: TextStyle(color: blackColor, fontWeight: FontWeight.bold),
            ),
            children: [
              SimpleDialogOption(
                child: Text(
                  "Capture with Camera",
                  style: TextStyle(color: blackColor),
                ),
                onPressed: () => capturePhotoWithCamera(),
              ),
              SimpleDialogOption(
                child: Text(
                  "Select from Gallery",
                  style: TextStyle(color: blackColor),
                ),
                onPressed: () => pickPhotoFromGallery(),
              ),
              SimpleDialogOption(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: blackColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  capturePhotoWithCamera() async {
    Navigator.pop(context);
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);
    uploadImage(pickedFile);
    // setState(() {
    //   file = imageFile;
    // });
  }

  pickPhotoFromGallery() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
    Navigator.pop(context);
    uploadImage(pickedFile);
    // setState(() {
    //   file = imageFile;
    // });
  }

  Future<void> uploadImage(PickedFile? imageFile) async {
    try {
      String filename = imageFile!.path.split('/').last;
      FormData formData = new FormData.fromMap({
        "id": GetStorage().read("user").id,
        "image":
            await MultipartFile.fromFile(imageFile.path, filename: filename),
      });
      Response response = await Dio().post("${baseUrl}upload_image",
          data: formData, options: Options(contentType: "multipart/form-data"));
      Fluttertoast.showToast(
          msg: "Picture uploaded Successfully",
          backgroundColor: backgroundColor,
          textColor: textColor,
          fontSize: 14.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG);
    } catch (e) {
      print(e);
    }
  }
}
