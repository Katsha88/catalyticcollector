import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/cata.dart';
import 'package:flutter/material.dart';
import 'package:catalytic_collector/models/cata.dart';
import 'package:flutter/rendering.dart';

class CataTile2 extends StatelessWidget {
  final Cata cata;

  CataTile2({this.cata});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          borderOnForeground: true,
          elevation: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 20, 20.0, 5),
                child: Image.network(
                  cata.images,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                child: Text(
                  cata.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                child: Text(
                  cata.categories,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                child: Text(
                  cata.description,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              )
            ],
          )),
    );
  }
}
