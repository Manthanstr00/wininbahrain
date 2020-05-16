import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:wininbahrain/model/contests.dart';
import 'package:wininbahrain/themes/homepage_light_color.dart';
import 'package:wininbahrain/widgets/percent_indicator.dart';
import 'package:flutter/widgets.dart';

final TextStyle secondaryText = TextStyle(fontSize: 12, color: Colors.red[200]);
final TextStyle primaryText =
    TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold);

final TextStyle h6 =
    TextStyle(fontSize: 25, color: Colors.black54, fontWeight: FontWeight.bold);
final TextStyle h5 =
    TextStyle(fontSize: 23, color: Colors.black54, fontWeight: FontWeight.bold);
final TextStyle h4 =
    TextStyle(fontSize: 21, color: Colors.black54, fontWeight: FontWeight.bold);
final TextStyle h3 =
    TextStyle(fontSize: 19, color: Colors.black54, fontWeight: FontWeight.bold);
final TextStyle h2 =
    TextStyle(fontSize: 17, color: Colors.black54, fontWeight: FontWeight.bold);
final TextStyle h1 =
    TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold);

final TextStyle countdownText = TextStyle(
    fontSize: 14, color: Colors.red[300], fontWeight: FontWeight.bold);

final TextStyle cardHeading =
    TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54);
final TextStyle cardSubTitle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black45);

final counterText = TextStyle(fontSize: 11, color: Colors.black87);
final counterTextHighlight = TextStyle(fontSize: 11, color: Colors.red[400]);

final TextStyle currencyText = TextStyle(
    fontSize: 14, color: Colors.red[300], fontWeight: FontWeight.bold);

final TextStyle pointerText =
    TextStyle(fontSize: 11, color: Colors.black, fontWeight: FontWeight.bold);

screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Widget hr(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      color: Color(0x55B9F6CA));
}

String HOME_SCREEN = '/HomeScreen',
    IMAGE_SPLASH = '/ImageSplashScreen',
    VIDEO_SPALSH = '/VideoSplashScreen',
    ANIMATED_SPALSH = '/AnimatedSplashScreen';

class Constants {
  static const String POPPINS = "Poppins";
  static const String OPEN_SANS = "OpenSans";
  static const String SKIP = "Skip";
  static const String NEXT = "Next";
  static const String SLIDER_HEADING_1 = "Easy Exchange!";
  static const String SLIDER_HEADING_2 = "Easy to Use!";
  static const String SLIDER_HEADING_3 = "Connect with Others";
  static const String SLIDER_DESC =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies, erat vitae porta consequat.";
}

final backGradient = LinearGradient(
    colors: [Colors.red[300], Colors.red[900]],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

final shadow = [
  new BoxShadow(
    blurRadius: 1,
    spreadRadius: 1,
    color: Colors.black12,
    offset: new Offset(0.0, 0.0),
  )
];

boxShadow({double shadowStrength = 1, Offset offset = const Offset(0.0, 0.0)}) {
  return BoxShadow(
    blurRadius: shadowStrength,
    spreadRadius: shadowStrength,
    color: Colors.black12,
    offset: offset,
  );
}

final clipPathShadow = [
  new BoxShadow(
    blurRadius: 5,
    spreadRadius: 5,
    color: Colors.black12,
    offset: new Offset(0.0, -3.0),
  )
];

class CustomTextFields extends StatefulWidget {
  final String hintText, lableText;
  final TextEditingController controller;
  final TextInputType textInputType;

  CustomTextFields(
      {this.hintText, this.lableText, this.textInputType, this.controller});

  @override
  _CustomTextFieldsState createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          labelText: widget.lableText,
          hintText: widget.hintText,
          focusColor: Colors.purple[900],
          hoverColor: Colors.purple[900],
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class CustomAddressField extends StatefulWidget {
  final String hintText, lableText;
  final TextEditingController controller;

  CustomAddressField({this.hintText, this.lableText, this.controller});

  @override
  _CustomAddressFieldState createState() => _CustomAddressFieldState();
}

class _CustomAddressFieldState extends State<CustomAddressField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 4,
        decoration: InputDecoration(
          labelText: widget.lableText,
          hintText: widget.hintText,
          focusColor: Colors.purple[900],
          hoverColor: Colors.purple[900],
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class CustomDropDown extends StatefulWidget {
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String current;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        isExpanded: true,
        items: <String>[
          'Delivery not included',
          'International delivery included',
          'Delivery At additional Cost',
          'Collection only',
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String newValue) {
          setState(() {
            current = newValue;
          });
        },
        value: current,
        hint: Text("Please Select"),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String txt;
  final Color color;
  final Function onTapped;
  const NavButton({this.txt, this.color, this.onTapped});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: const EdgeInsets.all(15.0),
        color: color,
        //      splashColor: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(txt, style: kButtonTextStyle),
          ],
        ),
        onPressed: onTapped,
      ),
    );
  }
}

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
//  fontFamily: 'Roboto',
  color: Colors.white,
);

navPush(BuildContext context, Widget page) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => page));
}

navPop(BuildContext context) {
  Navigator.of(context).pop();
}

Widget circularContainer(double height, Color color,
    {Color borderColor = Colors.transparent, double borderWidth = 2}) {
  return Opacity(
    opacity: 0.5,
    child: Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    ),
  );
}

Widget header(BuildContext context,
    {String title = "",
    String userAvatar = "",
    bool popButton = false,
    List<Widget> action = const [],
    LinearGradient gradient = const LinearGradient(
        colors: [Color(0xcc940000), Color(0xccB71C1C)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight)}) {
  var width = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Material(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      elevation: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Container(
            height: 85,
            width: width,
            decoration: BoxDecoration(gradient: gradient),
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    top: 30,
                    right: -100,
                    child: circularContainer(300, Colors.red[300])),
                Positioned(
                    top: -100,
                    left: -45,
                    child: circularContainer(width * .5, Colors.red[200])),
                Positioned(
                    top: -180,
                    right: -30,
                    child: circularContainer(width * .7, Colors.transparent,
                        borderColor: Colors.white38)),
                Positioned(
                    top: 35,
                    left: 0,
                    child: Container(
                        width: width,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: popButton == false
                                        ? IconButton(
                                            icon: Icon(
                                              Icons.menu,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                            onPressed: () {
                                              Scaffold.of(context).openDrawer();
                                            },
                                          )
                                        : IconButton(
                                            icon: Icon(
                                              Icons.arrow_back,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                  ),
                                  Text(
                                    title == null ? "" : title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        "https://pixelmator-pro.s3.amazonaws.com/community/avatar_empty@2x.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )))
              ],
            )),
      ),
    ),
  );
}

class InfoGreen extends StatefulWidget {
  final String info;

  InfoGreen(this.info);

  @override
  _InfoGreenState createState() => _InfoGreenState();
}

class _InfoGreenState extends State<InfoGreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.done,
            color: Colors.green,
            size: 26,
          ),
          Text(
            widget.info,
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRed extends StatefulWidget {
  final String infored;
  InfoRed(this.infored);
  @override
  _InfoRedState createState() => _InfoRedState();
}

class _InfoRedState extends State<InfoRed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.close,
            color: Colors.red,
            size: 26,
          ),
          Text(
            widget.infored,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}

borderRadius({double radius}) {
  return BorderRadius.all(Radius.circular(radius));
}

borderRadiusOn(
    {double topRight = 0,
    double topLeft = 0,
    double bottomLeft = 0,
    double bottomRight = 0}) {
  return BorderRadius.only(
      bottomRight: Radius.circular(bottomRight),
      bottomLeft: Radius.circular(bottomLeft),
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight));
}

class CustomScaffold extends StatelessWidget {
  final List<Widget> body;
  final String appBarTitle;
  final bool popButton;
  final bool headerOnTop;
  final Color backgroundColor;
  final bool headerVisible;
  final List<Widget> action;
  final LinearGradient gradient;
  final LinearGradient backgroundGradient;
  final Widget floatingActionButton;

  static const defaultBackGradient = LinearGradient(
      colors: [Colors.white, Colors.white],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  CustomScaffold(
      {this.body,
      this.floatingActionButton,
      this.backgroundGradient = defaultBackGradient,
      this.gradient = const LinearGradient(
          colors: [Color(0xffff3a50), Color(0xffa50013)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft),
      this.action = const [],
      this.appBarTitle,
      this.popButton = false,
      this.headerOnTop = false,
      this.backgroundColor = Colors.white,
      this.headerVisible = true});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      backgroundColor: backgroundColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient == defaultBackGradient
              ? defaultBackGradient
              : backgroundGradient,
        ),
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(children: <Widget>[
          SingleChildScrollView(
              child: headerOnTop == false
                  ? Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: Column(
                        children: body,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: body,
                      ),
                    )),
          Visibility(
              visible: headerVisible,
              child: header(context,
                  title: appBarTitle,
                  popButton: popButton,
                  action: action,
                  gradient: gradient)),
        ]),
      ),
    );
  }
}

Widget categoryRow(
  String title,
  Color primary,
  Color textColor,
  IconData icon,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    height: 30,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: LightColor.titleTextColor, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: Icon(
            icon,
            size: 15,
            color: Colors.black38,
          ),
          onPressed: () {},
        )
      ],
    ),
  );
}

class CustomLabel extends StatelessWidget {
  final String label;
  final TextAlign align;
  CustomLabel({this.label, this.align = TextAlign.start});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                  color: Colors.red[900], fontWeight: FontWeight.bold),
              textAlign: align,
            ),
          ],
        ),
      ),
    );
  }
}

class NavOutlineButton extends StatelessWidget {
  final Function onTapped;
  final String txt;
  NavOutlineButton({this.txt, this.onTapped});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 5, right: 5),
          child: GestureDetector(
            onTap: onTapped,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 2, color: Colors.greenAccent),
              ),
              child: Text(txt),
            ),
          ),
        ),
      ],
    );
  }
}

Widget productCard(BuildContext context,
    {String backgroundImage,
    String name,
    String price,
    int totalTickets,
    int soldTickets,
    Function tap}) {
  final width = MediaQuery.of(context).size.width;
  final soldPercent = soldTickets / totalTickets * 100;
  return GestureDetector(
    onTap: tap,
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 3,
                spreadRadius: 3,
                offset: Offset(2, -2))
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        height: 130,
        width: 200,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(backgroundImage),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(0xaa000000),
                              fontWeight: FontWeight.w900)),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showCharityModal(context);
                    },
                    child: Container(
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          "assets/svgIcons/organs.svg",
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 4,
                    child: GestureDetector(
                      onTap: tap,
                      child: Container(
                        width: 70,
                        height: 30,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                                colors: [Color(0xaa940000), Color(0xaaB71C1C)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                        child: Center(
                            child: Text(
                          "Enter",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

showCharityModal(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Charity Details")],
            ),
          ],
        );
      });
}

Widget productWidget(BuildContext context,
    {ContestsModel contest, Function tap}) {
  final width = MediaQuery.of(context).size.width;
  final soldPercent = contest.soldTickets / contest.totalTickets * 100;
  return NotificationListener<ScrollNotification>(
    onNotification: (val) {
      print('asdasdasd');
      return true;
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width,
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: shadow,
                        color: Colors.black12,
                      ),
                      width: width,
                      child: Image.network(
                        contest.displayImage,
                        fit: BoxFit.cover,
                      ),
                      height: 200,
                    ),
                  ),
                  Positioned(
                    right: -3,
                    top: 8,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white54,
//                                borderRadius: BorderRadius.all(
//                                  Radius.circular(3),
//                                ),
                        ),
                        child: Text(
                          '${contest.price} BD',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: 50 * width / 100,
                    child: Text(
                      contest.contestName,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                contest.charity == true
                    ? GestureDetector(
                        onTap: () {
                          showCharityModal(context);
                        },
                        child: Container(
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              "assets/svgIcons/organs.svg",
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  elevation: 4,
                  child: GestureDetector(
                    onTap: tap,
                    child: Container(
                      width: 80,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gradient: LinearGradient(
                              colors: [Color(0xaa940000), Color(0xaaB71C1C)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: Center(
                          child: Text(
                        "Enter",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:
                PercentIndicator(percent: soldPercent, label: "Sold Tickets"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              width: 90 * width / 100,
              height: 1,
              color: Colors.black12,
            ),
          )
        ],
      ),
    ),
  );
}

Widget card({
  String imgPath,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 8),
    child: Material(
      elevation: 4,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 90,
          width: 110,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imgPath), fit: BoxFit.cover),
          ),
        ),
      ),
    ),
  );
}

class ModalTile extends StatelessWidget {
  final String title;
  final Function tap;
  final IconData icon;

  ModalTile({this.tap, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            onPressed: tap,
            child: Text(
              title,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.start,
            )),
      ),
    );
  }
}

Widget imagePicker(BuildContext context,
    {File imageFile, Function tap, double height, double width}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: GestureDetector(
      onTap: tap,
      child: imageFile == null
          ? Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    boxShadow(shadowStrength: 2),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: height == null ? screenWidth(context) / 3 : height,
              width: width == null ? screenWidth(context) / 3 : width,
              child: Center(
                child: SvgPicture.asset(
                  "assets/svgIcons/upload.svg",
                  height: 50,
                  width: 5,
                  color: Colors.red[200],
                ),
              ))
          : Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    boxShadow(shadowStrength: 2),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: height == null ? screenWidth(context) / 3 : height,
              width: width == null ? screenWidth(context) / 3 : width,
              child: Stack(
                children: [
                  Container(
                    height: height == null ? screenWidth(context) / 3 : height,
                    width: width == null ? screenWidth(context) / 3 : width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.file(
                        imageFile,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
//          Positioned(
//            right: 5,
//            bottom: 5,
//            child: Container(
//              decoration: BoxDecoration(
//                boxShadow: [boxShadow(shadowStrength: 3)],
//                borderRadius: BorderRadius.all(Radius.circular(6)),
//                color: Colors.white54
//              ),
//                padding: EdgeInsets.all(4),
//                child: Icon(Icons.delete,color: Colors.black,)),
//          ),
                ],
              ),
            ),
    ),
  );
}

String daynameMonthDayYear(DateTime date) {
  var formatter = new DateFormat("yMMMMEEEEd");
  String formatted = formatter.format(date);
  return formatted;
}

Widget inputField(
    {TextEditingController controller,
    String labelText,
    String hintText,
    bool readOnly = false,
    int maxLines = 1}) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextFormField(
        readOnly: readOnly,
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 0),
            labelText: labelText,
            hintText: hintText,
            hintMaxLines: 1,
            hintStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black26),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black26),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red[100],
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red[300],
                ))),
      ));
}

Widget bottomButton(BuildContext context,
    {Function tap, String buttonTitle, Color buttonColor = Colors.blue}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: SizedBox(
      height: 40.0,
      child: Material(
          borderRadius: BorderRadius.circular(10.0),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Center(
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            padding: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: buttonColor,
            onPressed: tap,
          )),
    ),
  );
}

Widget textButton(
    {Color backgroundColor,
    String title,
    Function tap,
    double,
    BoxShadow shadows = const BoxShadow()}) {
  return GestureDetector(
    onTap: tap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}

Widget dropDown(BuildContext context,
    {String hint, List items, Function onChange, String value, double width}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    child: Container(
      width: width == null ? MediaQuery.of(context).size.width : width,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            width: 1,
            color: Colors.red[100],
          )),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            hint: Text(
              hint,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black26),
            ),
            underline: SizedBox(),
            items: items,
            onChanged: onChange,
            value: value,
            elevation: 2,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
            isDense: true,
          ),
        ),
      ),
    ),
  );
}

Widget checkBox({bool value, String label, Function onChange}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            label,
            style: h2,
          ),
        ),
        Checkbox(
          value: value,
          onChanged: onChange,
        ),
      ],
    ),
  );
}
