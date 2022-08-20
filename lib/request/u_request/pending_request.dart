import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sos/config/config.dart';
import 'package:sos/request/request_functions.dart';
import 'package:sos/request/request_model/request.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/widgets/myloading.dart';
import 'package:sos/widgets/u_widgets/mydrawer.dart';

// ignore: must_be_immutable
class PendingRequest extends StatefulWidget {
  PendingRequest({Key? key}) : super(key: key);

  @override
  _PendingRequestState createState() => _PendingRequestState();
}

class _PendingRequestState extends State<PendingRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage("assets/images/e.jpg"), fit: BoxFit.fill),
          ),
        ),
        title: Text(
          "Pending",
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontFamily: 'Brand-Regular'),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/d.jpg"), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          child: FutureBuilder<List<Request>?>(
              future: getAllRequest(1),
              builder: (context, snapshot) {
                //checkng if future is resolved or not
                if (snapshot.connectionState == ConnectionState.done) {
                  //if we get an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "${snapshot.error} occured",
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                    //if we got our data
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Center(
                          child: Text(
                        "No pending request available",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white54, fontSize: 17),
                      ));
                    } else {
                      return ListView.builder(
                          padding: EdgeInsets.only(
                              top: 15, left: 10, right: 10, bottom: 10),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: borderColor, width: 0.3),
                                  ),
                                  padding: EdgeInsets.only(
                                      left: 20, top: 5, right: 5),
                                  width: MediaQuery.of(context).size.width,
                                  height: 75,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Text(
                                                  "You requested the service of ${snapshot.data![index].handyman.name} for ${snapshot.data![index].request_for.title} service",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      letterSpacing: 1.5,
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontFamily: fontFamily),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20,
                                                          right: 20,
                                                          top: 2,
                                                          bottom: 3),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: borderColor,
                                                            width: 0.5),
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: Text(
                                                        "Report issue",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: textColor,
                                                            fontFamily:
                                                                fontFamily),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 20,
                                                          right: 20,
                                                          top: 3,
                                                          bottom: 3),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: borderColor,
                                                            width: 0.5),
                                                        color: Colors.red,
                                                      ),
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: textColor,
                                                            fontFamily:
                                                                fontFamily),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 3,
                                  color: borderColor,
                                ),
                                Divider(
                                  height: 15,
                                  color: Colors.transparent,
                                  thickness: 4,
                                ),
                              ],
                            );
                          });
                    }
                  } else {
                    return Center(
                        child: Text(
                      "you are welcome",
                      style: TextStyle(color: textColor),
                    ));
                  }
                }
                //Displaying loading Spinner to indicate wating
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
      drawer: MyDrawer("request"),
    );
  }

  Future<void> acceptRequest(int handymenId) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return MyProgressDialog(message: "Reporting issues...");
        });

    try {
      Response response = await Dio()
          .post("http://192.168.43.19:8000/api/userReporting", data: {
        "user_id": SOSApp.sharedPreferences.getInt('id'),
        'handymen_id': handymenId,
      });

      // await getAllRequest(context);
    } catch (e) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "error occured",
          fontSize: 18.0,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
