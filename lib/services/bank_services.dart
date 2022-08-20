import 'package:dio/dio.dart';
import 'package:sos/payment/user_card.dart';

import 'http_services.dart';

final _dio = new Dio();
Future<List<UserCard>?> getUserCards() async {
  List<UserCard> userCard = [];
  try {
    var response = await _dio.get("${baseUrl}cards");
    response.data['services'].forEach((card) {
      userCard.add(UserCard.fromJson(card));
    });
  } on DioError catch (e) {
    if (e.response!.statusCode == 500) {
      print("============== SERVER ERROR ===================");
    } else if (e.response!.statusCode == 404) {
      print("================= NOT FOUND ===================");
    }
  }
  return userCard;
}
