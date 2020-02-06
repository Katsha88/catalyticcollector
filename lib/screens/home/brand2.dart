import 'package:catalytic_collector/screens/home/setting_form1.dart';
import 'package:catalytic_collector/services/auth1.dart';
import 'package:catalytic_collector/shared/threedots.dart';
import 'itemtoshow.dart';
import 'favorites.dart';

import 'package:flutter/material.dart';

import 'final.dart';

import 'package:catalytic_collector/screens/template.dart';
import 'package:catalytic_collector/services/databrand.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:catalytic_collector/models/brandclass.dart';
import 'package:catalytic_collector/screens/home/brandgrid.dart';

class Brand2 extends StatelessWidget {
  final AuthService1 _auth = AuthService1();
  static int j = 0;

  @override
  Widget build(BuildContext context) {




    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm1(),
            );
          });
    }

    void choiceAction(String choice) {
      if (choice == Threedots.Settings) {
        _showSettingsPanel();
      } else if (choice == Threedots.My_favorite) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Favorites()));
      } else if (choice == Threedots.Product_for_sell) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Itemtoshow()));
      } else if (choice == Threedots.SignOut) {
        _auth.signOut();
      }
    }

    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brand'),
          backgroundColor: Colors.lightBlue,
          elevation: 0.0,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Threedots.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body:    StreamProvider<List<Brandclass>>.value(
        value: Databrand().bradfrom,
          child: Brandgrid() ,

        )

    );
  }
}
