import 'package:flutter/material.dart';
import 'package:sos/config/config.dart';
import 'package:sos/models/onlyhandymen/only_handymen.dart';
import 'package:sos/services/http_handyman.dart';
import 'package:sos/utils/mycolor.dart';
import 'package:sos/views/v_handyman/v_handyman_details.dart';
import 'package:sos/widgets/u_widgets/mydrawer.dart';

// ignore: must_be_immutable
class ChooseHandyman extends StatefulWidget {
  int? service_id;
  String? title;
  ChooseHandyman({this.service_id, this.title, Key? key}) : super(key: key);

  @override
  _ChooseHandymanState createState() => _ChooseHandymanState();
}

class _ChooseHandymanState extends State<ChooseHandyman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Choose Handyman",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage("assets/images/c.jpg"), fit: BoxFit.fill),
          ),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/d.jpg"), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          child: FutureBuilder<List<OnlyHandymen>?>(
              future: assignHandyman(widget.service_id, widget.title),
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
                        "No handyman currently available for this service, check back later",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white54, fontSize: 17),
                      ));
                    } else {
                      return ListView.builder(
                          padding: EdgeInsets.only(
                              top: 15, left: 10, right: 10, bottom: 10),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int _index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => HandymanDetails(
                                                service_id: widget.service_id,
                                                title: widget.title,
                                                id: snapshot.data![_index].id,
                                                image:
                                                    "${snapshot.data![_index].image}",
                                                name:
                                                    "${snapshot.data![_index].name}",
                                                email:
                                                    "${snapshot.data![_index].email}",
                                                phone:
                                                    "${snapshot.data![_index].phone}",
                                                distance: snapshot
                                                    .data![_index].distance,
                                                state:
                                                    "${snapshot.data![_index].state}",
                                                lga:
                                                    "${snapshot.data![_index].lga}",
                                                address:
                                                    "${snapshot.data![_index].address}",
                                                about:
                                                    "${snapshot.data![_index].about}")));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: borderColor, width: 0.3),
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        bottom: 12,
                                        top: 10,
                                        right: 5),
                                    width: MediaQuery.of(context).size.width,
                                    height: 120,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                "${SOSApp.hUpload}${snapshot.data![_index].image}")),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Text(
                                                  "${snapshot.data![_index].name}",
                                                  style: TextStyle(
                                                      letterSpacing: 2,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      color: Colors.red,
                                                      fontFamily:
                                                          'Brand-Regular'),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "${snapshot.data![_index].address}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    // color: Colors.white,
                                                    fontSize: 11,
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'Brand-Regular'),
                                              ),
                                              SizedBox(
                                                height: 3.0,
                                              ),
                                              Expanded(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "90% customer satisfaction",
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily:
                                                            'Brand-Regular'),
                                                  ),
                                                  Text(
                                                    "(300 ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily:
                                                            'Brand-Regular'),
                                                  ),
                                                  Text(
                                                    "customers",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily:
                                                            'Brand-Regular'),
                                                  ),
                                                  Text(
                                                    ")",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  ),
                                                ],
                                              )),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                (snapshot.data![_index]
                                                                .distance /
                                                            1000)
                                                        .toStringAsFixed(3) +
                                                    " KM from you",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w800,
                                                    fontFamily:
                                                        'Brand-Regular'),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${snapshot.data![_index].lga}",
                                                      style: TextStyle(
                                                          color: Colors.yellow,
                                                          fontSize: 10,
                                                          fontFamily:
                                                              'Brand-Regular'),
                                                    ),
                                                    SizedBox(width: 15),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: 70,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    borderColor,
                                                                width: 0.5)),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "Request",
                                                          style: TextStyle(
                                                              fontSize: 8,
                                                              color: textColor),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
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
      drawer: MyDrawer("services"),
    );
  }
}
