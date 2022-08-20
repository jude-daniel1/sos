import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sos/config/config.dart';
import 'package:sos/request/u_request/progressing_request.dart';
import 'package:sos/request/u_request/user_request.dart';
import 'package:sos/utils/mycolor.dart';

class MakePayment {
  BuildContext ctx;
  int price;
  int requestId;
  int handymanId;
  MakePayment(
      {required this.ctx,
      required this.price,
      required this.requestId,
      required this.handymanId});

  PaystackPlugin paystack = PaystackPlugin();

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'IOS';
    } else {
      platform = 'Android';
    }
    return 'ChargedFrom${platform}_${DateTime.now().microsecondsSinceEpoch}';
  }

  PaymentCard _getCardUI() {
    //you can send the details if you already have it
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  Future initializePlugin() async {
    await paystack.initialize(
        publicKey: "pk_test_30603102ae11a98000155bdb7b76d9de43cc87be");
  }

  // Methods for charging card
  chargeCardAndMakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = GetStorage().read('user').email
        ..reference = _getReference()
        ..card = _getCardUI();

      CheckoutResponse response = await paystack.checkout(
        ctx,
        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
        logo: FlutterLogo(
          size: 24,
        ),
      );
      print("Response $response");
      if (response.status == true) {
        print("Transaction Successfully");
        subscribe(response.reference);
      } else {
        print("Transaction Failed");
      }
    });
  }

  Future<void> subscribe(String? reference) async {
    try {
      Response response =
          await Dio().post("http://192.168.42.252:8000/api/savePayment", data: {
        "price": price,
        "user_id": GetStorage().read('user').id,
        "handymen_id": handymanId,
        "request_id": requestId,
        "reference": reference,
        "medium": 'card'
      });

      Fluttertoast.showToast(
          msg: "Payment successful",
          textColor: textColor,
          fontSize: 16.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT);

      Navigator.push(ctx, MaterialPageRoute(builder: (_) => UserRequest()));
    } catch (e) {
      print("========== $e ==============");
    }
  }
}
