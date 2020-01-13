

import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/screens/home/final.dart';

import 'package:catalytic_collector/screens/home/setting_form1.dart';
import 'package:catalytic_collector/services/auth1.dart';
import 'package:catalytic_collector/services/database2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catalytic_collector/services/databaseuser.dart';
import 'package:catalytic_collector/models/User1.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Itempage extends StatelessWidget {
  String photo;
  String name;
  String brand;
  String description;
  String price;

  Itempage({this.photo, this.name, this.brand, this.description, this.price});

  final AuthService1 _auth = AuthService1();

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

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Sell'),
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
          FlatButton.icon(
            icon: Icon(Icons.settings),
            label: Text('settings'),
            onPressed: () => _showSettingsPanel(),
          )
        ],
      ),
      body: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          borderOnForeground: true,
          elevation: 16,
          child: ListView(children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 20, 20.0, 5),
              child: Image.network(
                photo,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
              child: Text(
                name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
              child: Text(
                brand,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
              child: Text(
                description,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
              child: Text(
                price,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                child: RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Want to sell this product',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final FirebaseUser user = await auth.currentUser();
                      showAlertDialog(BuildContext context) {

                        // set up the button
                        Widget okButton = FlatButton(
                          child: Text("OK"),
                          onPressed: () { },
                        );

                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: Text(brand),
                          content: Text("Your item:$name is added for selling"),
                          actions: [
                            okButton,
                          ],
                        );

                        // show the dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      }
                       DataUser(uid: user.uid).updatesellData([name]);
                      showAlertDialog(context);



                    })),
          ])),
    );
  }
}
