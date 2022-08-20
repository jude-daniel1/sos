import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos/request/request_model/request.dart';
import 'package:sos/services/http_service.dart';

Future<List<Request>?> getAllRequest(int x) async {
  List<Request> requests = [];
  try {
    var response = await Dio().post("${baseUrl}myrequest",
        data: {"user_id": GetStorage().read('user').id});

    if (x == 1) {
      response.data['pending'].forEach((request) {
        requests.add(Request.fromJson(request));
      });
    } else if (x == 2) {
      response.data['pending'].forEach((request) {
        requests.add(Request.fromJson(request));
      });
    } else if (x == 3) {
      response.data['completed'].forEach((request) {
        requests.add(Request.fromJson(request));
      });
    } else {
      response.data['rejected'].forEach((request) {
        requests.add(Request.fromJson(request));
      });
    }
  } on DioError catch (e) {
    if (e.response!.statusCode == 500) {
      print("============== SERVER ERROR ===================");
    } else if (e.response!.statusCode == 404) {
      print("================= NOT FOUND ===================");
    }
  }
  return requests;
}
