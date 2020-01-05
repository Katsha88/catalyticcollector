import 'dart:math';

import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/models/parameter.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

class CataTile2 extends StatelessWidget {
  final Cata cata;
  final Parameter para;


  double calculate(){
    double price2 = (double.parse(cata.pd) * para.pd1 + double.parse(cata.pt) * para.pt1 +double.parse(cata.rh) * para.rh1)* 4.1326 * 0.8* double.parse(cata.weight) -(double.parse(cata.weight)*10*4.1326)
    ;
     double pricefinal = max(0, price2);
     return pricefinal;
  }






  CataTile2({this.cata, this.para});

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
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                child: Text(
               "RM "+calculate().toStringAsFixed(1) ,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              )
            ],
          )),
    );
  }
}
