import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/screens/home/brew_tile.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:catalytic_collector/models/branduser.dart';
import 'package:flutter/cupertino.dart';
import 'package:catalytic_collector/shared/loadingcar.dart';

class CataList extends StatefulWidget {
  final favorites;
  final todata;
  final itemsearch;
  final List <Branduser> companies;

  CataList({this.favorites, this.itemsearch, this.todata , this.companies});

  @override
  _CataListState createState() => _CataListState();
}

 MovieListBloc movieListBloc;
MovieListBloc indicator;

TextEditingController controllertext = TextEditingController();



class _CataListState extends State<CataList> {

  List item;


   ScrollController controller = ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String l= controllertext.text.toUpperCase();
    String j = l.replaceAll(new RegExp(r"[^A-Za-z0-9]"), "");

    movieListBloc = MovieListBloc(toshorten: widget.todata,searchitem: j);
    movieListBloc.fetchOnEntry(j, widget.todata);
    controller.addListener(_scrollListener);

    controllertext.addListener(() {
      if (!mounted) return;
      setState(()  {
        String l= controllertext.text.toUpperCase();
        String k = l.replaceAll(new RegExp(r"[^A-Za-z0-9]"), "");
         movieListBloc.fetchOnEntry(k, widget.todata);


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

          controller: controller,


          itemBuilder: (context, index) {
            if (index == snapshot.data.length) {
             if(snapshot.data.length !=0) {

              return CupertinoActivityIndicator();}
            }
            print("Inside builder");
            return CataTile3(
              cata: snapshot.data[index],
              para: paras[0],
              currency: currencies[0],
              favorites: widget.favorites,
              companies: widget.companies
            );

          },
      itemCount: snapshot.data.length+1,
        );





          }
          else {

            return Loading();
          }





          });
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      print("at the end of list");
      String l= controllertext.text.toUpperCase();
      String j = l.replaceAll(new RegExp(r"[^A-Za-z0-9]"), "");
      movieListBloc.fetchNextMovies(j, widget.todata);
    }

  }


}
