import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final double topRight;
  final double bottomRight;
  final double topLeft;
  final double bottomLeft;
  final String hintText;
  final TextEditingController controller;
  InputWidget({this.hintText,this.controller,this.topRight = 0.0, this.bottomRight = 0.0, this.topLeft = 0.0, this.bottomLeft = 0.0,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        child: Material(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(bottomLeft),
                  topLeft: Radius.circular(topLeft),
                  bottomRight: Radius.circular(bottomRight),
                  topRight: Radius.circular(topRight))),

          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
            ),
          ),
        ),
      ),
    );
  }
}
