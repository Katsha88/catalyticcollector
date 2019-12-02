import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/screens/home/brew_list.dart';
import 'package:catalytic_collector/screens/home/settings_form.dart';
import 'package:catalytic_collector/services/auth.dart';
import 'package:catalytic_collector/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  final AuthService _auth = AuthService();

  _launchCaller() async {
    const url = "tel:+60341317539";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Sorry Soryy $url';
    }
  }

  _launchURL() async {
    const url = 'https://my03.awfatech.com/baseerahgombak/sps/edaftar/reg.php';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchMaps() async {
    String googleUrl = 'comgooglemaps:https://goo.gl/maps/vwqjnULQPJyaGm4M6}';
    String appleUrl = 'https://goo.gl/maps/vwqjnULQPJyaGm4M6}';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  _launchEmail() async {
    const url =
        'mailto:admin@atalyticcollector.com?subject=Ask%20and%20we%20will%20answer&body=I%20have%20question%20about:';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text('About Us'),
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
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: FloatingActionButton(
                        heroTag: "btn1",
                        backgroundColor: Colors.white,
                        onPressed: () {
                          _launchEmail();
                        },
                        child: Icon(
                          Icons.email,
                          color: Color(0xFFE52020),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: FloatingActionButton(
                      heroTag: "btn2",
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _launchMaps();
                      },
                      child: Icon(
                        Icons.map,
                        color: Color(0xFFE52020),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: FloatingActionButton(
                      heroTag: "btn3",
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _launchCaller();
                      },
                      child: Icon(
                        Icons.add_call,
                        color: Color(0xFFE52020),
                      ),
                    ),
                  ),
                ],
              )
            ])),
      ),
    );
  }
}
