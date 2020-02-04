import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/screens/home/brew_tile.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cata_tile2.dart';
import 'package:catalytic_collector/models/parameter.dart';
import 'package:catalytic_collector/models/currencyuser.dart';
import 'package:catalytic_collector/models/User1.dart';
import 'package:catalytic_collector/services/database2.dart';
import 'package:catalytic_collector/screens/home/final.dart';
import 'package:catalytic_collector/services/databaseuser.dart';
import 'package:catalytic_collector/screens/home/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalytic_collector/screens/home/fuckoff.dart';

class Addmore extends StatefulWidget {
  final favorites;
  final todata;
  final itemsearch;

  Addmore({this.favorites, this.itemsearch, this.todata});

  @override
  _AddmoreState createState() => _AddmoreState();
}




class _AddmoreState extends State<Addmore> {



  @override
  Widget build(BuildContext context) {

print("it is called from add more");



    return StreamProvider<List<Cata>>.value(
        value:
        DatabaseService2(toshorten: widget.todata, searchitem: widget.itemsearch)
            .catasthen,


        child: Fuckoff(favorites:widget.favorites)



    );
  }


}
