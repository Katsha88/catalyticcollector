import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/screens/home/brew_tile.dart';
import 'package:catalytic_collector/screens/home/cata_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cata_tile2.dart';
import 'package:catalytic_collector/models/parameter.dart';
import 'package:catalytic_collector/models/parameter.dart';



class CataList extends StatefulWidget {
  @override
  _CataListState createState() => _CataListState();
}

class _CataListState extends State<CataList> {
  @override
  Widget build(BuildContext context) {

    final catas = Provider.of<List<Cata>>(context) ?? [];
    final paras = Provider.of<List<Parameter>>(context) ?? [];

    return ListView.builder(
      itemCount: catas.length,
      itemBuilder: (context, index) {
        return CataTile2(cata: catas[index], para: paras[0],);
      },
    );
  }
}