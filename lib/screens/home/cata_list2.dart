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

class CataList2 extends StatefulWidget {
  final favorites;
  final todata;
  final itemsearch;

  CataList2({this.favorites, this.itemsearch, this.todata});

  @override
  _CataList2State createState() => _CataList2State();
}




class _CataList2State extends State<CataList2> {

  List item;




  int total1 = 0;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    print("fdfdfd");
    total1 = total1 + 5;
    print(total1);




    return StreamProvider<List<Cata>>.value(
        value:
        DatabaseService2(toshorten: widget.todata, searchitem: widget.itemsearch)
            .catas,


            child: Fuckoff(favorites:widget.favorites,todata: widget.todata, itemsearch: widget.itemsearch,)



        );
  }


}
