import 'package:flutter/material.dart';
import 'package:wininbahrain/providers/percentage.dart';
import 'package:provider/provider.dart';

class PercentIndicator extends StatelessWidget {
  final double percent;
  final String label;
  final Color primaryColor;
  PercentIndicator({@required this.percent,this.label = "",this.primaryColor = Colors.red});
  final GlobalKey fullWidth = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final PercentProvider percentProvider = Provider.of<PercentProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => percentProvider.getWidthOfContainer(fullWidth));
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            key: fullWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(3),
                ),
                border: Border.all(width: 1, color: Colors.black26)),
            height: 15,
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              width: percentProvider.fullWidth,
              height: label == "" ? 30 : 35,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    top: label == "" ? 0 : 10,
                    left: percent * percentProvider.fullWidth / 100 - 11,
                    child: Text(
                      "${percent.toInt()}%",
                      style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,color: primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    left: 3,
                      top: 2,
                      child: Text(label,style: percentProvider.labelStyle,)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                  color: Colors.red[100],
                ),
                width: percentProvider.fullWidth,
                height: 11),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: AnimatedContainer(
                duration: Duration(milliseconds: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                  gradient: LinearGradient(
                      colors: [Colors.black54, primaryColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                ),
                width: percent * percentProvider.fullWidth / 100,
                height: 11),
          ),
        ],
      ),
    );
  }
}
