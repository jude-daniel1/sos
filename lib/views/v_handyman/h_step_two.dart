import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sos/repository.dart';
import 'package:sos/services/http_service.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/v_handyman/h_step_three.dart';
import 'package:sos/widgets/myloading.dart';

// ignore: must_be_immutable
class HandymanStepTwo extends StatefulWidget {
  String email, name, phone, password;
  HandymanStepTwo(
      {required this.email,
      required this.name,
      required this.phone,
      required this.password,
      Key? key})
      : super(key: key);

  @override
  _HandymanStepTwoState createState() => _HandymanStepTwoState();
}

class _HandymanStepTwoState extends State<HandymanStepTwo> {
  final GlobalKey<FormState> _key = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController aboutTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  String userImageUrl = "";
  String currentItem = "";
  String address = "";
  bool loading = false;
  Repository repo = Repository();
  List<String> _states = ["Choose a state"];
  List<String> _lgas = ["Choose lga..."];
  String _selectedState = "Choose a state";
  String _selectedLGA = "Choose lga...";

  @override
  void initState() {
    _states = List.from(_states)..addAll(repo.getStates());
    super.initState();
  }

  void _onSelectedState(String value) {
    setState(() {
      _selectedLGA = "Choose lga...";
      _lgas = ["Choose lga..."];
      _selectedState = value;
      _lgas = List.from(_lgas)..addAll(repo.getLocalByState(value));
    });
  }

  void _onSelectedLGA(String value) {
    setState(() => _selectedLGA = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/b.jpg"), fit: BoxFit.fill),
          ),
          alignment: Alignment.center,
          child:
              ListView(padding: EdgeInsets.fromLTRB(40, 10, 40, 20), children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    child: Text("1",
                        style: TextStyle(
                          color: textColor,
                        )),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: borderColor)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    child: Text("2", style: TextStyle(color: Colors.black)),
                    decoration:
                        BoxDecoration(color: textColor, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    child: Text("3",
                        style: TextStyle(
                          color: textColor,
                        )),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: borderColor)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: arrowColor,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: arrowColor,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: arrowColor,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Form(
                          key: _key,
                          child: Column(
                            children: [
                              Theme(
                                data: Theme.of(context).copyWith(
                                  canvasColor: Colors.black87,
                                ),
                                child: DropdownButton<String>(
                                  style: TextStyle(color: textColor3),
                                  isExpanded: true,
                                  items:
                                      _states.map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (value) =>
                                      _onSelectedState(value!),
                                  value: _selectedState,
                                ),
                              ),
                              Theme(
                                data: Theme.of(context).copyWith(
                                  canvasColor: Colors.black87,
                                ),
                                child: DropdownButton<String>(
                                  style: TextStyle(color: textColor3),
                                  isExpanded: true,
                                  items: _lgas.map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  // onChanged: (value) => print(value),
                                  onChanged: (value) => _onSelectedLGA(value!),
                                  value: _selectedLGA,
                                ),
                              ),
                              TextFormField(
                                style: TextStyle(color: textColor),
                                controller: addressTextEditingController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.white54, fontSize: 12),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  hintText: "Address",
                                  labelStyle: TextStyle(color: textColor),
                                  prefixIcon: Container(
                                    transform: Matrix4.translationValues(
                                        -15.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.home,
                                      size: 18,
                                      color: iconColor,
                                    ),
                                  ),
                                ),
                                validator: (String? address) {
                                  if (address!.trim().isEmpty) {
                                    return "Address cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (String? address) {
                                  this.address = address!.trim();
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: borderColor)),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    style: TextStyle(color: textColor),
                                    controller: aboutTextEditingController,
                                    maxLines: 4,
                                    decoration: InputDecoration.collapsed(
                                        hintStyle:
                                            TextStyle(color: Colors.white54),
                                        hintText: "About Me"),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  if (!_key.currentState!.validate()) {
                                    return;
                                  }
                                  _key.currentState!.save();
                                  // uploadImage();
                                  print(
                                      "$_selectedState, $_selectedLGA, $address, ${aboutTextEditingController.text.trim()}");
                                  moveToPageThree();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.white)),
                                  child: Text(
                                    "NEXT",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }

  Future moveToPageThree() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return MyProgressDialog(message: "Please wait...");
        });
    var serviceTitle = await getServicetitle();
    print("============================");
    print(serviceTitle);
    if (serviceTitle != null) {
      print("==============NOT NUll ==============");
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HandymanStepThree(
                    services: serviceTitle,
                    email: widget.email,
                    name: widget.name,
                    phone: widget.phone,
                    password: widget.password,
                    state: _selectedState,
                    lga: _selectedLGA,
                    address: address,
                    about: aboutTextEditingController.text.trim(),
                  )));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "Something went wrong",
          backgroundColor: backgroundColor,
          textColor: textColor,
          fontSize: 14.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
