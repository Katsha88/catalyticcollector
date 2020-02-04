import 'package:catalytic_collector/models/User1.dart';

import 'package:catalytic_collector/services/databaseuser.dart';
import 'package:catalytic_collector/shared/constants.dart';
import 'package:catalytic_collector/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:catalytic_collector/services/data_currency.dart';
import 'package:catalytic_collector/models/currencyuser.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

class Itemtoshow extends StatefulWidget {
  @override
  ItemtoshowState createState() => ItemtoshowState();
}

class ItemtoshowState extends State<Itemtoshow> {
  final _formKey1 = GlobalKey<FormState>();

  // form values
  String _currentName;
  String _currentPhone;
  String currentCountry;
  bool check = true;

  @override
  Widget build(BuildContext context) {
    User1 user = Provider.of<User1>(context);

    return StreamBuilder<UserData1>(
        stream: DataUser(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData1 userData = snapshot.data;
            List mama = userData.sell;

            return Scaffold(
                appBar: AppBar(
                  title: Text("Your Items"),
                ),
                body: new ListView.builder(
                    itemCount: mama.length,
                    itemBuilder: (BuildContext txt, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Card(
                          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                          child: ListTile(
                              leading: CircleAvatar(
                                  radius: 25.0,
                                  child: FadeInImage.assetNetwork(
                                      placeholder: 'assets/source.gif',
                                      image:mama[index]["photo"])),

                              title: Text(mama[index]["name"]),
                              subtitle: Text("Quantity:" +
                                  mama[index]["number"].toString()),
                              trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () async {
                                    await DataUser(uid: user.uid)
                                        .removesellData([
                                      {
                                        "name": mama[index]["name"],
                                        "number": mama[index]["number"],
                                        "photo": mama[index]["photo"],
                                      "price": mama[index]["price"]

                                      }
                                    ]);
                                  })),
                        ),
                      );
                    }));
          } else {
            return Loading();
          }
        });
  }
}
