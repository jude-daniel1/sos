import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos/models/u_models/users.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/v_users/u_dashboard.dart';
import 'package:sos/widgets/myloading.dart';

//192.168.43.148
final baseUrl = 'http://192.168.42.252:8000/api/';

final _dio = new Dio();

Future sendVerificationCode(String url, String email) async {
  try {
    var response = await _dio.post('$baseUrl$url',
        data: {"email": "judedaniel360@gmail.com", "type": "customer"});
    return response;
  } on DioError catch (e) {
    print(e.message.toString());
  }
}

Future userRegister(String url, String email, String phone, String password,
    String name) async {
  try {
    var response = await _dio.post('$baseUrl$url', data: {
      "email": email,
      "phone": phone,
      "password": password,
      "name": name
    });
    return response;
  } on DioError catch (e) {
    print(e.message.toString());
  }
}

Future<void> userLogin(
    String url, String email, String password, context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return MyProgressDialog(message: "Authenticating, Please wait...");
      });
  try {
    var response = await _dio.post('$baseUrl$url', data: {
      "email": email,
      "password": password,
      "type": "customer",
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      GetStorage().write("user", Users.fromJson(response.data['user']));
      Fluttertoast.showToast(
          msg: "Login Successfully",
          backgroundColor: backgroundColor,
          textColor: textColor,
          fontSize: 14.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG);
      Get.to(UserDashboard());
    } else {
      Fluttertoast.showToast(
          msg: "Username or Password Wrong",
          backgroundColor: backgroundColor,
          textColor: textColor,
          fontSize: 14.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG);
    }
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
          msg: e.response!.data['user'],
          backgroundColor: backgroundColor,
          textColor: textColor,
          fontSize: 16.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
