import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SOSApp {
  static const String appName = 'SOS';
  static late SharedPreferences sharedPreferences;
  static final String serviceFolder =
      "http://192.168.42.252:8000/uploads/services/";
  static final String localhost = "http://192.168.43.19:8000/api";
  static final String upload = "http://192.168.42.252:8000/uploads/users/";
  static final String hUpload = "http://192.168.42.252:8000/uploads/handyman/";

  static final baseUrl = 'http://192.168.42.252:8000/api/';

  static List services = [];

  static final String userName = 'name';
  static final String userEmail = 'email';
  static final String userPhone = 'phone';
  static final String userPhotoUrl = 'url';
  static final String userUID = 'uid';
  static final String userState = 'state';
  static final String userLGA = 'lga';
  static final String userAdress = 'address';
  static final String userDevice = 'device';

  static final String techName = 'name';
  static final String techEmail = 'email';
  static final String techPhone = 'phone';
  static final String techPhotoUrl = 'url';
  static final String techUID = 'uid';
  static final String techState = 'state';
  static final String techLGA = 'lga';
  static final String techAdress = 'address';
  static final String techDevice = 'device';
  static final String techStatus = 'status';
}
