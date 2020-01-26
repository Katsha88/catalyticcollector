import 'dart:math';

import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/models/currencyuser.dart';
import 'package:catalytic_collector/models/parameter.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:catalytic_collector/screens/home/itempage.dart';
import 'package:catalytic_collector/screens/home/itempage3.dart';


class CataTile2 extends StatelessWidget {
  final Cata cata;
  final Parameter para;
  final Currencyuser currency;


  double calculate(){
    double price2 = (cata.pd * para.pd1 + cata.pt * para.pt1 +cata.rh
        * para.rh1)* currency.exrate * currency.profiterate* cata.weight -(cata.weight*10*
        currency.exrate)
    ;
    double pricefinal = max(0, price2);
    return pricefinal;
  }




  CataTile2({this.cata, this.para ,this.currency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child:
      GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Itempage3(photo:cata.images, name: cata.name, brand: cata.categories,description: cata.description, price: calculate().toStringAsFixed(1) ,)
            ));
          },
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
                      cata.images[0],
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
                      currency.symbol+" "+calculate().toStringAsFixed(1) ,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  )
                ],
              ))),
    );
  }
}