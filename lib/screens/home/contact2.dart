import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';




class Contact2 extends StatefulWidget {
  @override
  _Contact2State createState() => new _Contact2State();
}

class _Contact2State extends State<Contact2> {

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[HomeScreeTopPart(), HomeScreenBottomPart()],
        ),
      ),
    );
  }
}

class HomeScreeTopPart extends StatelessWidget {
  _launchCaller() async {
    const url = "tel:+60341317539";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL() async {
    const url = 'https://catalyticcollector.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchMaps() async {
    String googleUrl = 'comgooglemaps:https://goo.gl/maps/vwqjnULQPJyaGm4M6}';
    String appleUrl = 'https://goo.gl/maps/vwqjnULQPJyaGm4M6}';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  _launchEmail() async {
    const url =
        'mailto:admin@catalyticcollector.com?subject=Ask%20and%20we%20will%20answer&body=I%20have%20question%20about:';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 420.0,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: Mclipper(),
            child: Container(
              height: 370.0,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 10.0),
                    blurRadius: 10.0)
              ]),
              child: Stack(
                children: <Widget>[
                  Carousel(
                      images: [
                        Image.asset("assets/3.jpg",
                            fit: BoxFit.cover, width: double.infinity),
                        Image.asset("assets/2.jpg",
                            fit: BoxFit.cover, width: double.infinity),


                      ]),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0x00000000),
                              const Color(0xD9333333)
                            ],
                            stops: [
                              0.0,
                              0.9
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(0.0, 1.0))),
                    child: Padding(
                      padding: EdgeInsets.only(top: 120.0, left: 95.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "WE BUY INDUSTRIAL CATALYST",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontFamily: "SF-Pro-Display-Bold"),
                          ),
                          Text(
                            "Catalytic Collector",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45.0,
                                fontFamily: "SF-Pro-Display-Bold"),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 360.0,
            child: FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: FloatingActionButton(
                        heroTag: "btn1",
                        backgroundColor: Colors.white,
                        onPressed: () {
                          _launchEmail();
                        },
                        child: Icon(
                          Icons.email,
                          color: Colors.lightBlue,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: FloatingActionButton(
                      heroTag: "btn2",
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _launchMaps();
                      },
                      child: Icon(
                        Icons.map,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: FloatingActionButton(
                      heroTag: "btn3",
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _launchCaller();
                      },
                      child: Icon(
                        Icons.add_call,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: RaisedButton(
                      onPressed: () {
                        _launchURL();
                      },
                      color: Colors.lightBlue,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Website",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: "SF-Pro-Display-Bold"),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          RotatedBox(
                            quarterTurns: 2,

                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreenBottomPart extends StatelessWidget {
  _launchChannel() async {
    const url = "https://www.youtube.com/user/baseerah2016/videos";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<String> images = [
    "assets/face.png","assets/inst.png","assets/you.png","assets/twitter.png",

  ];

  List<String> titles = ["Facebook", "Youtube", "Instagram", "Twitter"];

  List<Widget> movies() {
    List<Widget> movieList = new List();

    for (int i = 0; i < 4; i++) {
      var movieitem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
        child: Container(
          height: 220.0,
          width: 135.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                child: Image.asset(
                  images[i],
                  width: double.infinity,
                  height: 130.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                child: Text(titles[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: "SF-Pro-Display-Bold")),
              ),
            ],
          ),
        ),
      );
      movieList.add(movieitem);
    }
    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 360.0,
      margin: EdgeInsets.only(left: 65.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Other Social Media",
                  style: TextStyle(
                      fontSize: 22.0, fontFamily: "SF-Pro-Display-Bold"),
                ),

              ],
            ),
          ),
          Container(
            height: 250.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movies(),
            ),
          )
        ],
      ),
    );
  }
}

class Mclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 100.0);

    var controlpoint = Offset(35.0, size.height);
    var endpoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        controlpoint.dx, controlpoint.dy, endpoint.dx, endpoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}