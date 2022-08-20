import 'package:flutter/material.dart';
import 'package:sos/config/config.dart';
import 'package:sos/models/service/service.dart';
import 'package:sos/services/http_handyman.dart';
import 'package:sos/services/http_service.dart';
import 'package:sos/views/choose_handyman.dart';
import 'package:sos/widgets/u_widgets/mydrawer.dart';

class Services extends StatefulWidget {
  Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Services",
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
          child: FutureBuilder<List<Service>?>(
              future: getServices(),
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
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext _context, int _index) {
                          return InkWell(
                              onTap: () {
                                // assignHandyman(snapshot.data![_index].id,
                                //     snapshot.data![_index].title);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ChooseHandyman(
                                            service_id:
                                                snapshot.data![_index].id,
                                            title:
                                                snapshot.data![_index].title)));
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                      ),
                                      child: Image.network(
                                        "${SOSApp.serviceFolder}${snapshot.data![_index].image}",
                                        width: 40,
                                        scale: 1.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${snapshot.data![_index].title}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        });
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
