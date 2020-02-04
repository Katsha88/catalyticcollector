import 'package:catalytic_collector/models/User1.dart';

import 'package:catalytic_collector/services/databaseuser.dart';
import 'package:catalytic_collector/shared/constants.dart';
import 'package:catalytic_collector/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  @override
  FavoritesState createState() => FavoritesState();

}

class  FavoritesState extends State<Favorites> {
  final _formKey1 = GlobalKey<FormState>();

  // form values

  String currentCountry;
  bool check =true;




  @override
  Widget build(BuildContext context) {


    User1 user = Provider.of<User1>(context);


    return StreamBuilder<UserData1>(
        stream: DataUser(uid: user.uid).userData,
        builder: (context, snapshot) {

          if(snapshot.hasData) {
            UserData1 userData = snapshot.data;
            List baba = userData.favorites;

            return Scaffold(
                appBar: AppBar(
                  title: Text("Your Favorites"),


                ),
                body:
                new ListView.builder
                  (
                    itemCount: baba.length,
                    itemBuilder: (BuildContext txt, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Card(
                          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 25.0,

                                backgroundImage: NetworkImage(baba[index]["photo"])
                            ),
                            title: Text(baba[index]["name"]),

                          ),
                        ),
                      );

                    }
                )

            );


          }
          else{
            return Loading();
          }
        });

  }
}
