import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/widgets/myloading.dart';

// ignore: must_be_immutable
class UserRatingDialog extends StatefulWidget {
  int requestId, handymenId;
  UserRatingDialog({required this.requestId, required this.handymenId});

  @override
  _UserRatingDialogState createState() => _UserRatingDialogState();
}

class _UserRatingDialogState extends State<UserRatingDialog> {
  int? selected;
  String? value;
  int? rating;
  @override
  void initState() {
    // TODO: implement initState
    selected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 420,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text(
                  'Express your level of satisfaction with this handyman',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              RadioListTile(
                  value: 1,
                  groupValue: selected,
                  activeColor: Colors.green,
                  title: Text(
                    "Highly Dissatisfied",
                    style: TextStyle(fontFamily: fontFamily, fontSize: 13),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      selected = val as int?;
                    });
                  }),
              RadioListTile(
                  value: 2,
                  groupValue: selected,
                  activeColor: Colors.green,
                  title: Text(
                    "Dissatisfied",
                    style: TextStyle(fontFamily: fontFamily, fontSize: 13),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      selected = val as int?;
                    });
                  }),
              RadioListTile(
                  value: 3,
                  groupValue: selected,
                  activeColor: Colors.green,
                  title: Text(
                    "Neutral",
                    style: TextStyle(fontFamily: fontFamily, fontSize: 13),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      selected = val as int?;
                    });
                  }),
              RadioListTile(
                  value: 4,
                  groupValue: selected,
                  activeColor: Colors.green,
                  title: Text(
                    "Satisfied",
                    style: TextStyle(fontFamily: fontFamily, fontSize: 13),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      selected = val as int?;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              RadioListTile(
                  value: 5,
                  groupValue: selected,
                  activeColor: Colors.green,
                  title: Text(
                    "Highly Satisfied",
                    style: TextStyle(fontFamily: fontFamily, fontSize: 13),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      selected = val as int?;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () async {
                    if (selected == 1) {
                      value = "Highly Dissatisfied";
                      rating = 0;
                    } else if (selected == 2) {
                      value = "Dissatisfied";
                      rating = 1;
                    } else if (selected == 3) {
                      value = "Neutral";
                      rating = 2;
                    } else if (selected == 4) {
                      value = "Satisfied";
                      rating = 3;
                    } else {
                      value = "Highly Satisfied";
                      rating = 4;
                    }
                    //userRating(context);
                  },
                  child: Text(
                    "Rate Handyman",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> userRating(BuildContext context) async {
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return MyProgressDialog(message: "Rating Handyman...");
  //       });

  //   try {
  //     Response response = await Dio()
  //         .post("http://192.168.43.19:8000/api/handymanRating", data: {
  //       "user_id": judesosApp.sharedPreferences.getInt('id'),
  //       'handymen_id': widget.handymenId,
  //       'request_id': widget.requestId,
  //       'name': value,
  //       'rating': rating,
  //     });

  //     Fluttertoast.showToast(
  //         msg: "Rating successfull",
  //         fontSize: 16.0,
  //         gravity: ToastGravity.BOTTOM,
  //         toastLength: Toast.LENGTH_SHORT);

  //     Navigator.pop(context);
  //     Route route = MaterialPageRoute(
  //         builder: (c) => Request(
  //             pending: response.data['pending'],
  //             progressing: response.data['progressing'],
  //             completed: response.data['completed'],
  //             rejected: response.data['rejected']));
  //     Navigator.pushReplacement(context, route);
  //   } on DioError catch (e) {
  //     Navigator.pop(context);
  //     Fluttertoast.showToast(
  //         msg: e.toString(),
  //         textColor: textColor,
  //         fontSize: 16.0,
  //         gravity: ToastGravity.BOTTOM,
  //         toastLength: Toast.LENGTH_LONG);
  //   }
  // }
}
