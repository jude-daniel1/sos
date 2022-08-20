// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:sos/request/u_request/completed_request.dart';
import 'package:sos/request/u_request/pending_request.dart';
import 'package:sos/request/u_request/progressing_request.dart';
import 'package:sos/request/u_request/rejected_requests.dart';

// ignore: must_be_immutable
class UserRequest extends StatefulWidget {
  UserRequest({Key? key}) : super(key: key);

  @override
  _UserRequestState createState() => _UserRequestState();
}

class _UserRequestState extends State<UserRequest> {
  int _currentIndex = 0;
  List<Widget> _children() => [
        PendingRequest(),
        ProgressingRequest(),
        CompletedRequest(),
        RejectedRequest()
      ];
  var color = Colors.black;
  var activeColor = Colors.white;
  var inActiveColor = Colors.white38;
  var inprogressColor = Colors.white38;
  var pendingColor = Colors.white;
  var completedColor = Colors.white54;
  var rejectedColor = Colors.white54;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _children();
    return Scaffold(
      backgroundColor: color,
      body: children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("assets/images/c.jpg"), fit: BoxFit.fill),
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pending,
                  color: pendingColor,
                ),
                title: Text(
                  "Pending",
                  style: TextStyle(color: pendingColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.done,
                  color: inprogressColor,
                ),
                title:
                    Text("Progress", style: TextStyle(color: inprogressColor))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.done_all,
                  color: completedColor,
                ),
                title:
                    Text("Completed", style: TextStyle(color: completedColor))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.cancel,
                  color: rejectedColor,
                ),
                title:
                    Text("Rejected", style: TextStyle(color: rejectedColor))),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    if (index == 0) {
      pendingColor = Colors.white;
      inprogressColor = inActiveColor;
      completedColor = inActiveColor;
      rejectedColor = inActiveColor;
    } else if (index == 1) {
      pendingColor = inActiveColor;
      inprogressColor = activeColor;
      completedColor = inActiveColor;
      rejectedColor = inActiveColor;
    } else if (index == 2) {
      pendingColor = inActiveColor;
      inprogressColor = inActiveColor;
      completedColor = activeColor;
      rejectedColor = inActiveColor;
    } else {
      pendingColor = inActiveColor;
      inprogressColor = inActiveColor;
      completedColor = inActiveColor;
      rejectedColor = activeColor;
    }
    setState(() {
      _currentIndex = index;
    });
  }
}
