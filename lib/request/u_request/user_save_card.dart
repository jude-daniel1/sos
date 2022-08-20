// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sos/utils/inputFormaters.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/utils/utils.dart';
import 'package:sos/widgets/button.dart';
import 'package:sos/widgets/u_widgets/mydrawer.dart';

// ignore: must_be_immutable
class UserSaveCard extends StatefulWidget {
  UserSaveCard({Key? key}) : super(key: key);

  @override
  _UserSaveCardState createState() => _UserSaveCardState();
}

class _UserSaveCardState extends State<UserSaveCard> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _cardNumber = TextEditingController();
  TextEditingController _expDate = TextEditingController();
  TextEditingController _cvv = TextEditingController();
  TextEditingController _amount = TextEditingController();
  var color = Colors.white;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Save Card",
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
      drawer: MyDrawer("card"),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("assets/images/b.jpg"), fit: BoxFit.fill),
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 20, right: 10),
          children: [
            Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.09),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "S",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 65,
                                fontFamily: 'Brand-Regular'),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white70, width: 6)),
                          child: Container(
                              child: Image.asset(
                            "assets/images/plum.png",
                            width: 40,
                          )),
                        ),
                        Container(
                          child: Text(
                            "S",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 65,
                                fontFamily: 'Brand-Regular'),
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Text(
                        "Handyman Services",
                        style: TextStyle(
                          color: Colors.white60,
                          fontFamily: 'Brand-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    SizedBox(height: 5),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: "Card Number",
                                border: InputBorder.none,
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              controller: _cardNumber,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                                new LengthLimitingTextInputFormatter(19),
                                new CardNumberInputFormatter()
                              ],
                              validator: validateCardNumWithLuhnAlgorithm,
                            ),
                            decoration: BoxDecoration(
                                color: hexToColor("#F5F6FA"),
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: TextFormField(
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'MM/YY',
                                      border: InputBorder.none,
                                    ),
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly,
                                      new LengthLimitingTextInputFormatter(4),
                                      new CardMonthInputFormatter()
                                    ],
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _expDate,
                                    validator: validateDate,
                                  ),
                                  decoration: BoxDecoration(
                                      color: hexToColor("#F5F6FA"),
                                      borderRadius: BorderRadius.circular(3))),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: TextFormField(
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: "CVV",
                                        border: InputBorder.none,
                                      ),
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly,
                                        new LengthLimitingTextInputFormatter(3),
                                      ],
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _cvv,
                                      validator: validateCVV),
                                  decoration: BoxDecoration(
                                      color: hexToColor("#F5F6FA"),
                                      borderRadius: BorderRadius.circular(3))),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Button(
                      child: Text("Save Card",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      onClick: () async {
                        if (_formKey.currentState!.validate()) {
                          // saveCard();
                        }
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
