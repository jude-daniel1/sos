import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sos/DialogBox/user_option_box.dart';
import 'package:sos/DialogBox/user_report_dialog.dart';
import 'package:sos/request/request_functions.dart';
import 'package:sos/request/request_model/request.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/widgets/u_widgets/mydrawer.dart';

// ignore: must_be_immutable
class ProgressingRequest extends StatefulWidget {
  ProgressingRequest({Key? key}) : super(key: key);

  @override
  _ProgressingRequestState createState() => _ProgressingRequestState();
}

class _ProgressingRequestState extends State<ProgressingRequest> {
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
          "Progressing",
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
              future: getAllRequest(2),
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
                        "No progressing request",
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: borderColor, width: 0.3),
                                  ),
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, right: 5, bottom: 8),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(children: [
                                    Center(
                                      child: Text(
                                        "The request of ${snapshot.data![index].handyman.name} for  ${snapshot.data![index].request_for.title} is in-progress",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            letterSpacing: 1.5,
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontFamily: fontFamily),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    snapshot.data![index].progress !=
                                            "completed"
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                left: 30, right: 20),
                                            child: Text(
                                              "Click completed once the task is done",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.green,
                                                  fontFamily: fontFamily),
                                            ),
                                          )
                                        : Text(
                                            "waiting for handyman's confirmation",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.green,
                                                fontFamily: fontFamily)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        snapshot.data![index].progress !=
                                                "completed"
                                            ? InkWell(
                                                onTap: () {
                                                  showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (_) {
                                                        return UserOptionBox(
                                                            con: context,
                                                            requestId: snapshot
                                                                .data![index]
                                                                .id,
                                                            handymanId: snapshot
                                                                .data![index]
                                                                .handyman
                                                                .id);
                                                      });
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      top: 1,
                                                      bottom: 3),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: borderColor,
                                                        width: 0.5),
                                                    color: Colors.green,
                                                  ),
                                                  child: Text(
                                                    "Completed",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: textColor,
                                                        fontFamily: fontFamily),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (_) {
                                                    return UserReportDialog(
                                                        requestId: snapshot
                                                            .data![index].id);
                                                  });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 5,
                                                  right: 5,
                                                  top: 1,
                                                  bottom: 3),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: borderColor,
                                                    width: 0.5),
                                                color: Colors.red,
                                              ),
                                              child: Text(
                                                "Report issues",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: textColor,
                                                    fontFamily: fontFamily),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ]),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 2,
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
}
