import 'dart:math';

import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/models/currencyuser.dart';
import 'package:catalytic_collector/models/parameter.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:catalytic_collector/screens/home/itempage.dart';
import 'package:catalytic_collector/screens/home/itempage3.dart';
import 'package:catalytic_collector/services/databaseuser.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CataTile2 extends StatefulWidget {
  final Cata cata;
  final Parameter para;
  final Currencyuser currency;
  final List favorites;





  double calculate() {

    double total = 0;
    for(int j =0 ; j< cata.parameter.length; j++){
      double price2 = (cata.parameter[j]['pd'] * para.pd1 + cata.parameter[j]['pt']
          * para.pt1 + cata.parameter[j]['rh']
          * para.rh1) * currency.exrate * currency.profiterate * cata.parameter[j]['weight'] -
          (cata.parameter[j]['weight']* 10 *
              currency.exrate)
      ;
      double pricefinal = max(0, price2);
      total = total + pricefinal;


    }

    return total;
  }


  CataTile2({Key key , this.cata, this.para, this.currency, this.favorites }) :super(key:key) ;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CataTile2State();
  }
}
class CataTile2State extends State <CataTile2> {
  ScrollController controller = ScrollController();
  bool alreadyclick ;
  bool stop

;

  @override
  initState() {
    super.initState();


 stop =false;
 alreadyclick =false;


  }
  Widget build(BuildContext context) {



    if (stop == false){
    for(int i =0 ; i< widget.favorites.length; i++){
      if(widget.cata.name ==  widget.favorites[i]["name"]){

        setState((){
          alreadyclick= true;
        stop =true;
        });

      }}}


    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child:
      GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    Itempage3(photo: widget.cata.images,
                      name: widget.cata.name,
                      brand: widget.cata.categories,
                      description: widget.cata.description,
                      price:widget. calculate().toStringAsFixed(1),
                      symbol: widget.currency.symbol,)
                ));
          },
          child: Card(

              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              borderOnForeground: true,
              elevation: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 20, 20.0, 5),
                    child: Image.network(
                      widget.cata.images[0],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                    child: Text(
                      widget.cata.name,
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                    child: Text(
                     widget. cata.categories,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                    child: Text(
                     widget. cata.description,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  Row(children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                      child: Text(
                       widget. currency.symbol + " " + widget.calculate().toStringAsFixed(1),
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    Container(
                      child: new IconButton( // Add the lines from here...
                        icon: Icon(

                          alreadyclick ? Icons.favorite : Icons.favorite_border,
                          color: alreadyclick ? Colors.red : null,
                          ),

                        onPressed: () async {
                          final FirebaseAuth auth = FirebaseAuth.instance;
                          final FirebaseUser user = await auth.currentUser();
                          if (!alreadyclick){
                            setState(() {
                              alreadyclick= true;

                            });

                            await DataUser(uid: user.uid)
                                .updatefavoritesData([{"name":widget.cata.name , "photo":widget.cata.images[0],}]);
                          }
                          else {
                            setState(() {
                              alreadyclick= false;

                            });
                            await DataUser(uid: user.uid)
                                .removefavoritesData([{"name":widget.cata.name , "photo":widget.cata.images[0],}]);
                          }





                        }

                        ,

                      ),

                    ),

                  ],

                  ),

                ],
              ))),
    );
  }










}

