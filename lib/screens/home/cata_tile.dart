import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/cata.dart';
import 'package:flutter/material.dart';
import 'package:catalytic_collector/models/cata.dart';

class CataTile extends StatelessWidget {

  final Cata cata;
  CataTile({ this.cata });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown,
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(cata.categories),
          subtitle: Text('Takes ${cata.categories} sugar(s)'),
        ),
      ),
    );
  }
}