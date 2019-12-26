import 'package:catalytic_collector/models/brew.dart';

import 'package:catalytic_collector/screens/home/brew_list.dart';
import 'package:catalytic_collector/screens/home/settings_form.dart';
import 'package:catalytic_collector/services/auth.dart';
import 'package:catalytic_collector/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'final.dart';
import 'package:catalytic_collector/services/database2.dart';
import 'package:catalytic_collector/screens/template.dart';

class Brand extends StatelessWidget {
  final AuthService _auth = AuthService();
  static int j=0 ;
  Future <void> changej() {
    j= 5;

  }


  @override
  Widget build(BuildContext context) {
    var spacecrafts = [
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/KiaHyundai-logo-1.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/Isuzu-Logo-1.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/Alfa-Romeo-Logo-1.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/mercedes-benz-logo-1.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/Mitsubishi-logo-1.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/Nissan-logo-1.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/Proton-Logo-1.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/chevy-logo-1.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/daewoo-logo-1.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/Iveco-logo-1.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/BMW-Logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/daihatsu-logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/ferrrari-Logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/Fiat-logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/ford-logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/honda-logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/Jeep-logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/jaguar-Logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/mzada-logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/Mini-Cooper-logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/maserati-logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/Perodua-logo.png",
      "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/10/gm-logo.png",
    ];
    var myGridView = new GridView.builder(
      itemCount: spacecrafts.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.centerLeft,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
              child: new Image.network(spacecrafts[index]),
            ),
          ),
          onTap:  ()  {
j=5;

            Navigator.push (
              context,
              MaterialPageRoute(builder: (context) => Template()),


            );



          },
        );
      },
    );
j=7;
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Brand'),
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
          body: myGridView),
    );
  }
}