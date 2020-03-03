import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/cata.dart';


import 'package:catalytic_collector/screens/home/setting_form1.dart';
import 'package:catalytic_collector/services/auth1.dart';
import 'package:catalytic_collector/services/database2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catalytic_collector/shared/threedots.dart';
import 'favorites.dart';
import 'itemtoshow.dart';

class About extends StatelessWidget {

  final AuthService1 _auth = AuthService1();




  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm1(),
        );
      });
    }

    void choiceAction(String choice){
      if(choice == Threedots.Settings){
        _showSettingsPanel();
      }else if(choice == Threedots.My_favorite){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Favorites()
            ));
      }else if(choice == Threedots.Product_for_sell){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Itemtoshow()
            ));
      }
      else if(choice == Threedots.SignOut) {
        _auth.signOut();
      }
    }



    return  Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('About Us'),
          backgroundColor: Colors.lightBlue,
          elevation: 0.0,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return Threedots.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                    child: Text("You can be our partner, we have been working on catalytic converter since 2005. Evaluating used catalytic converter materials fairly is a considerable challenge. At first glance, their value prices are updating daily to reflect the material value. Our online catalogue (www.catalyticcollector.com) , containing more than 16,000 types of catalytic converter, is The best of the most complete databases on the market, creating much needed transparency in used catalysts. Selling used catalytic converters become much easier and our global network of agents can ensure our services to customers, wherever they are, appropriately and cost-effectively. As a scrap catalyst buyer, we can tell you that 97% of scrap catalytic converters have a reactive surface containing valuable metals including platinum, palladium or rhodium. catalyticcollector Company in malaysia has both deep expertise and technical knowledge that can maximize the renewal of precious metals through our recycling process. Transparency and trust are paramount in this industry so we have developed a catalogue that allows you to check the purchase prices we offer for each used catalytic converter. You can thus witness the purchase process serenely. Based on your location, we suggest you different slots for the collection of your material. After appraisal and payment for your used catalysts, we can issue all the documentation you need. If we are not able to provide you with our collection service, we have partners in the many countryis around the world and we can connect you with scrap converters buyers and DPF buyers… We also have a mailing/shipping service, but you need to follow precisely the process below Our online catalogue enables you to estimate the value of your old catalytic converters. Thanks to an algorithm we have set up, prices are updateing daily to reflect the material value. Thus, you can be sure to get the best possible price for your old catalytic converter!"

                      ,  style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16


                      ),
                    )
                )




        ),
      )
    ;
  }
}