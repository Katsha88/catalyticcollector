import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/screens/home/brew_tile.dart';
import 'package:catalytic_collector/screens/home/cata_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CataList extends StatefulWidget {
  @override
  _CataListState createState() => _CataListState();
}

class _CataListState extends State<CataList> {
  @override
  Widget build(BuildContext context) {

    final catas = Provider.of<List<Cata>>(context) ?? [];

    return ListView.builder(
      itemCount: catas.length,
      itemBuilder: (context, index) {
        return CataTile(cata: catas[index]);
      },
    );
  }
}