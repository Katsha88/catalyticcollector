import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/screens/home/brew_tile.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cata_tile3.dart';
import 'package:catalytic_collector/models/parameter.dart';
import 'package:catalytic_collector/models/currencyuser.dart';
import 'package:catalytic_collector/models/User1.dart';
import 'package:catalytic_collector/services/database2.dart';
import 'package:catalytic_collector/screens/home/final.dart';
import 'package:catalytic_collector/services/databaseuser.dart';
import 'package:catalytic_collector/screens/home/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalytic_collector/shared/loading.dart';

class CataList extends StatefulWidget {
  final favorites;
  final todata;
  final itemsearch;

  CataList({this.favorites, this.itemsearch, this.todata});

  @override
  _CataListState createState() => _CataListState();
}

 MovieListBloc movieListBloc;
TextEditingController controllertext = TextEditingController();



class _CataListState extends State<CataList> {

  List item;


  ScrollController controller = ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("inside initstate list");

    movieListBloc = MovieListBloc(toshorten: widget.todata,searchitem: controllertext.text);
    movieListBloc.fetchOnEntry(controllertext.text, widget.todata);
    controller.addListener(_scrollListener);

    controllertext.addListener(() {
      setState(() {
        movieListBloc.fetchOnEntry(controllertext.text, widget.todata);

      });
    });

  }

  int total1 = 0;
  bool check = false;

  @override
  Widget build(BuildContext context) {

    print("inside widget list");

    final paras = Provider.of<List<Parameter>>(context) ?? [];
    final currencies = Provider.of<List<Currencyuser>>(context) ?? [];

    return StreamBuilder<List<DocumentSnapshot>>(
        stream: movieListBloc.movieStream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {


    return ListView.builder(
          itemCount: snapshot.data.length,
          controller: controller,
          itemBuilder: (context, index) {
            print("Inside builder");
            return CataTile3(
              cata: snapshot.data[index],
              para: paras[0],
              currency: currencies[0],
              favorites: widget.favorites,
            );
          },
        );}
          else {

            return Loading();
          }

          });
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      print("at the end of list");
      movieListBloc.fetchNextMovies();
    }
  }
}
