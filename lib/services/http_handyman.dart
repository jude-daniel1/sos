import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos/models/h_models/handyman.dart';
import 'package:sos/models/onlyhandymen/only_handymen.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/choose_handyman.dart';
import 'package:sos/views/v_handyman/h_dashboard.dart';
import 'package:sos/widgets/myloading.dart';

//192.168.43.148
final baseUrl = 'http://192.168.42.252:8000/api/';

final _dio = new Dio();

Future sendVerificationCode(String url, String email) async {
  try {
    var response = await _dio.post('$baseUrl$url', data: {"email": email});
    List<String> myservice = ['Select a service'];
    response.data['services'].forEach((element) {
      myservice.add(element['title']);
    });
    print("===========================SERVICE HERE ==================");
    print(myservice);
    GetStorage().write("services", myservice);
    return response;
  } on DioError catch (e) {
    print(e.message.toString());
  }
}

Future<void> handymanLogin(
    String url, String code, String password, context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return MyProgressDialog(message: "Authenticating, Please wait...");
      });
  try {
    var response =
        await _dio.post('http://192.168.42.252:8000/api/hlogin', data: {
      "code": code,
      "password": password,
    });
    Navigator.pop(context);
    print("=========printing the response ===========");
    GetStorage()
        .write("handyman", Handyman.fromJson(response.data['handyman']));
    Fluttertoast.showToast(
        msg: "Login Successfully",
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 14.0,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG);
    Get.to(HandymanDashboard());
  } on DioError catch (e) {
    if (e.response!.statusCode == 500) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "Unable to connect to network",
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 14.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG);
    } else if (e.response!.statusCode == 404) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: e.response!.data['handyman'],
          backgroundColor: backgroundColor,
          textColor: textColor,
          fontSize: 16.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG);
    }
  }
}

// SELECT HANDYMEN BASED ON LOCATION
Future<List<OnlyHandymen>?> assignHandyman(
    int? service_id, String? title) async {
  var latitude = GetStorage().read("user").latitude as double;
  var longitude = GetStorage().read("user").longitude as double;
  var state = GetStorage().read("user").state;
  List<OnlyHandymen> finalHandymen = [];

  try {
    var response = await _dio.post("http://192.168.42.252:8000/api/handymen",
        data: {"service_id": service_id, "state": state});

    List<dynamic> distancesorted = [];
    Map<double, dynamic> mysev = {};
    response.data['handymen'].forEach((services) {
      var distanceInMeters = Geolocator.distanceBetween(
          latitude, longitude, services['latitude'], services['longitude']);
      services['distance'] = distanceInMeters;
      mysev[distanceInMeters] = services;
    });

    distancesorted = mysev.keys.toList()..sort();
    int i = 1;
    distancesorted.forEach((element) {
      if (i <= 5) {
        finalHandymen.add(OnlyHandymen.fromJson(mysev[element]));
      }
      i++;
    });

    // Route route = MaterialPageRoute(
    //     builder: (c) => ChooseHandyman(
    //         distance: distancesorted,
    //         handymen: finalHandymen,
    //         title: title,
    //         image: image,
    //         index: index));
    // Navigator.push(context, route);
  } on DioError catch (e) {
    print(e);
  }
  return finalHandymen;
}
