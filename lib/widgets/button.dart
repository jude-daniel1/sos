import 'package:flutter/material.dart';
import 'package:sos/utils/hexToColor.dart';

class Button extends StatelessWidget {
  final Widget child;
  final Function onClick;

  Button({required this.child, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.black12),
      child: Material(
        color: hexToColor("#41aa5e"),
        child: InkWell(
            child: Center(
          child: child,
        )),
      ),
    );
  }
}
