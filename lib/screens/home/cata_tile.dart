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
            radius: 25,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(cata.images),
          ),

          title: Text(cata.name + "\n" + cata.categories),
          subtitle: Text(cata.description),
        ),
      ),
    );
  }
}