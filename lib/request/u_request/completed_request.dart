import 'package:flutter/material.dart';
import 'package:sos/request/request_functions.dart';
import 'package:sos/request/request_model/request.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/widgets/u_widgets/mydrawer.dart';

// ignore: must_be_immutable
class CompletedRequest extends StatefulWidget {
  CompletedRequest({Key? key}) : super(key: key);

  @override
  _CompletedRequestState createState() => _CompletedRequestState();
}

class _CompletedRequestState extends State<CompletedRequest> {
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
          "Completed",
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
                        "No completed request available",
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
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Request name : ",
                                            style: TextStyle(
                                                color: textColor,
                                                fontFamily: fontFamily,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              "${snapshot.data![index].request_for.title} service",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                  fontFamily: fontFamily)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Handyman's name : ",
                                            style: TextStyle(
                                                color: textColor,
                                                fontFamily: fontFamily,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              "${snapshot.data![index].handyman.name}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                  fontFamily: fontFamily)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Handyman's phone no. : ",
                                            style: TextStyle(
                                                color: textColor,
                                                fontFamily: fontFamily,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              "${snapshot.data![index].handyman.phone}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                  fontFamily: fontFamily)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Completed date : ",
                                            style: TextStyle(
                                                color: textColor,
                                                fontFamily: fontFamily,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              "${snapshot.data![index].date}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                  fontFamily: fontFamily)),
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
}
