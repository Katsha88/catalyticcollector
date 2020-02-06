import 'package:catalytic_collector/screens/home/setting_form1.dart';
import 'package:catalytic_collector/services/auth1.dart';
import 'package:catalytic_collector/shared/threedots.dart';
import 'itemtoshow.dart';
import 'favorites.dart';

import 'package:flutter/material.dart';

import 'final.dart';
import 'package:catalytic_collector/shared/loadingcar.dart';

import 'package:catalytic_collector/screens/template.dart';
import 'package:catalytic_collector/services/databrand.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:catalytic_collector/models/brandclass.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Brandgrid extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BrandgridState();
  }
}
class BrandgridState extends State <Brandgrid> {
  static int j = 0;

  Widget build(BuildContext context) {
    final brand = Provider.of<List<Brandclass>>(context) ?? [];

     return GridView.builder(


      itemCount: brand.length,
      gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {

        return new GestureDetector(
          child: new Card(
            elevation: 5.0,
            child: new Container(
                alignment: Alignment.centerLeft,
                margin:
                new EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: CachedNetworkImage(
                    imageUrl: brand[index].photo,
                  placeholder: (context, url) => Loadingcar(),

                  )),
          ),
          onTap: () {
            FinalState.itemsearch = "";
            j = index + 1;

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Template()),
            );
          },
        );
      },
    );


  }










}

