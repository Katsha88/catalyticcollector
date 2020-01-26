import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:catalytic_collector/models/cata.dart';










class Itempage2 extends StatefulWidget {
  @override
  _Itempage2State createState() => new _Itempage2State();
}

class _Itempage2State extends State<Itempage2> {
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
  List photo;

  HomeScreeTopPart({this.photo});

  List<NetworkImage> images = List<NetworkImage>();

  List loop() {
    for (var i = 0; i < photo.length; i++) {
      images.add(NetworkImage(photo[i]));
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {

      return  new Container(
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
                      Carousel(images: loop()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
;
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
    "assets/face.png",
    "assets/inst.png",
    "assets/you.png",
    "assets/twitter.png",
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
