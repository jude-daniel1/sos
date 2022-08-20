import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/widgets/u_widgets/mydrawer.dart';

class UserPayment extends StatefulWidget {
  UserPayment({Key? key}) : super(key: key);

  @override
  _UserPaymentState createState() => _UserPaymentState();
}

class _UserPaymentState extends State<UserPayment> {
  var publicKey = "pk_test_30603102ae11a98000155bdb7b76d9de43cc87be";
  final plugin = PaystackPlugin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Payment Card",
            style: TextStyle(
                color: textColor, fontSize: 16, fontFamily: 'Brand-Regular'),
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage("images/c.jpg"), fit: BoxFit.fill),
            ),
          ),
        ),
        drawer: MyDrawer("card"),
        body: Container(
          child: Text("you are welcome"),
        ));
  }
}
