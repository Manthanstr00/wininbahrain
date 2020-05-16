import 'package:flutter/material.dart';
import 'package:wininbahrain/model/favouriteContests.dart';

class FavProvider extends ChangeNotifier{
    List<FavouritesModel> favourites = <FavouritesModel>[
        FavouritesModel(
            contestTitle: "Win Iphone 6s",
            displayImage:
            "https://i.pinimg.com/474x/af/15/87/af15878df2ea6f9f56612df9aa3e1a76.jpg",
            endDate: DateTime.now().add(Duration(days: 3))),
        FavouritesModel(
            contestTitle: "Win Iphone 6s",
            displayImage:
            "https://i.pinimg.com/474x/af/15/87/af15878df2ea6f9f56612df9aa3e1a76.jpg",
            endDate: DateTime.now().add(Duration(days: 3))),
        FavouritesModel(
            contestTitle: "Win Iphone 6s",
            displayImage:
            "https://i.pinimg.com/474x/af/15/87/af15878df2ea6f9f56612df9aa3e1a76.jpg",
            endDate: DateTime.now().add(Duration(days: 3))),
    ];
}