import 'package:flutter/material.dart';
import 'package:wininbahrain/themes/homepage_light_color.dart';

final TextStyle secondaryText = TextStyle(fontSize: 12, color: Colors.red[200]);
final TextStyle primaryText =
    TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold);

final TextStyle h6 =
    TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold);
final TextStyle h5 =
    TextStyle(fontSize: 23, color: Colors.black87, fontWeight: FontWeight.bold);
final TextStyle h4 =
    TextStyle(fontSize: 21, color: Colors.black87, fontWeight: FontWeight.bold);
final TextStyle h3 =
    TextStyle(fontSize: 19, color: Colors.black87, fontWeight: FontWeight.bold);
final TextStyle h2 =
    TextStyle(fontSize: 17, color: Colors.black87, fontWeight: FontWeight.bold);
final TextStyle h1 =
    TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold);

final TextStyle countdownText =
TextStyle(fontSize: 14, color: Colors.red[300], fontWeight: FontWeight.bold);


final TextStyle currencyText =
TextStyle(fontSize: 14, color: Colors.red[300], fontWeight: FontWeight.bold);

final TextStyle pointerText =
    TextStyle(fontSize: 11, color: Colors.black, fontWeight: FontWeight.bold);

screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}




screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
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
    colors: [Color(0xaa2a4b8f), Color(0xaa3a6cd3)],
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

class CustomTextFields extends StatefulWidget {
  final String hintText, lableText;
  final TextInputType textInputType;

  CustomTextFields({this.hintText, this.lableText, this.textInputType});

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

  CustomAddressField({this.hintText, this.lableText});

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
    {String title = "", bool popButton = false}) {
  var width = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Material(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      elevation: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        child: Container(
            height: 85,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xcc940000), Color(0xccB71C1C)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)
            ),
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
                          children: <Widget>[
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

class CustomScaffold extends StatelessWidget {
  final List<Widget> body;
  final String appBarTitle;
  final bool popButton;
  final bool headerOnTop;

  CustomScaffold(
      {this.body,
      this.appBarTitle,
      this.popButton = false,
      this.headerOnTop = false });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
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
                      children: body,
                    ),
                  )),
        header(context, title: appBarTitle, popButton: popButton),
      ]),
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
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                  color: LightColor.titleTextColor,
                  fontWeight: FontWeight.bold),
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

