import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class Showimage extends StatefulWidget {
  String url;

  Showimage({Key key, @required this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShowimgaeState();
  }
}

class _ShowimgaeState extends State<Showimage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Zoom photo"),
        ),
        body: PhotoView(
          imageProvider: NetworkImage(widget.url),
        ));
  }
}
