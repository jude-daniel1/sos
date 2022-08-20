import 'package:dio/dio.dart';
import 'package:sos/models/service/service.dart';

//192.168.43.148
final baseUrl = 'http://192.168.42.252:8000/api/';

final _dio = new Dio();
Future<List<Service>?> getServices() async {
  List<Service> services = [];
  try {
    var response = await _dio.get("${baseUrl}services");
    response.data['services'].forEach((service) {
      services.add(Service.fromJson(service));
    });
  } on DioError catch (e) {
    if (e.response!.statusCode == 500) {
      print("============== SERVER ERROR ===================");
    } else if (e.response!.statusCode == 404) {
      print("================= NOT FOUND ===================");
    }
  }
  return services;
}

Future getServicetitle() async {
  List<String> services = ["Choose service..."];
  try {
    var response = await _dio.get("${baseUrl}services");
    response.data['services'].forEach((service) {
      services.add(Service.fromJson(service).title.toString());
    });
  } on DioError catch (e) {
    if (e.response!.statusCode == 500) {
      print("============== SERVER ERROR ===================");
    } else if (e.response!.statusCode == 404) {
      print("================= NOT FOUND ===================");
    }
  }
  return services;
}
