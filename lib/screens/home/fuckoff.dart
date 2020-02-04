import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/screens/home/brew_tile.dart';
import 'package:catalytic_collector/screens/home/cata_list2.dart';

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
import 'package:catalytic_collector/screens/home/addmore.dart';

class Fuckoff extends StatefulWidget {
  final favorites;
  final todata;
  final itemsearch;

  Fuckoff({this.favorites,this.todata,this.itemsearch});




  @override
  _FuckoffState createState() => _FuckoffState();
}

class _FuckoffState extends State<Fuckoff> {
  ScrollController controller = ScrollController();

  MovieListBloc movieListBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    movieListBloc = MovieListBloc(toshorten: widget.todata,searchitem: widget.itemsearch);
    print("intistate");

    controller.addListener(_scrollListener);

  }

  @override
  Widget build(BuildContext context) {
    final paras = Provider.of<List<Parameter>>(context) ?? [];
    final currencies = Provider.of<List<Currencyuser>>(context) ?? [];
    final catas = Provider.of<List<Cata>>(context) ?? [];

   return ListView.builder(
      itemCount: catas.length,
      controller: controller,
      itemBuilder: (context, index) {
        return CataTile2(
          cata: catas[index],
          para: paras[0],
          currency: currencies[0],
          favorites: widget.favorites,
        );
      },
    );
  }

   _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      print("at the end of list");



    }
  }
}
