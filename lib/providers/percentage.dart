import 'package:flutter/material.dart';

class PercentProvider extends ChangeNotifier {
  double fullWidth = 0.0;
  double height = 0.0;

  TextStyle percentageStyle = TextStyle(
      fontSize: 9, fontWeight: FontWeight.bold, color: Colors.red[200]);
  TextStyle labelStyle = TextStyle(
      fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black26);

  getWidthOfContainer(key) {
    RenderBox percentContainer = key.currentContext.findRenderObject();
    fullWidth = percentContainer.size.width;
    notifyListeners();
  }
}
