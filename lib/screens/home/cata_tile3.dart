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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:catalytic_collector/shared/loadingcar.dart';
import 'package:catalytic_collector/models/branduser.dart';


class CataTile3 extends StatefulWidget {
  final DocumentSnapshot cata;
  final Parameter para;
  final Currencyuser currency;
  final List favorites;
  final List <Branduser> companies;



  List tofastphoto(){
  List a = cata["ImagesList"];
  if (a==[]){
    print("no photo");
    a = ["https://catalyticcollector.com/wp-content/uploads/2019/09/Default-1.jpg"];
  }
  List g = [];
  for (var i = 0; i < a.length; i++) {
  g.add(a[i].replaceAll("https://", "https://i0.wp.com/"));
  }
  return g;

  }



  double calculate() {

    double total = 0;
    for(int j =0 ; j< cata["parameter"].length; j++){
      double price2 = (cata["parameter"][j]['pd'] * para.pd1 + cata["parameter"][j]['pt']
          * para.pt1 + cata["parameter"][j]['rh']
          * para.rh1) * currency.exrate * currency.profiterate * cata["parameter"][j]['weight'] -
          (cata["parameter"][j]['weight']* 10 *
              currency.exrate)
      ;
      double pricefinal = max(0, price2);
      total = total + pricefinal;


    }

    return total;
  }


  CataTile3({Key key , this.cata, this.para, this.currency, this.favorites , this.companies}) :super(key:key) ;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CataTile3State();
  }
}
class CataTile3State extends State <CataTile3> {
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
        if(widget.cata["Meta: meta_title"] ==  widget.favorites[i]["name"]){

          setState((){
            alreadyclick= true;
            stop =true;
          });

        }}}

 getphoto(){

   if(widget.cata["Categories"]!= "NONE") {
     for (int j = 0; j < widget.companies.length; j++) {
       if (widget.companies[j].name == widget.cata["Categories"]) {
         return widget.companies[j].photo;
       }
     }
   }
   else {
     return "https://i0.wp.com/catalyticcollector.com/wp-content/uploads/2019/09/Default-1.jpg";
   }
    }


    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child:
      GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    Itempage3(photo: widget.tofastphoto(),
                      name: widget.cata["Meta: meta_title"],
                      brand: widget.cata["Categories"],
                      description: widget.cata["Short description"],
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

                  Stack( children: <Widget>[
                    Container(

                      padding: EdgeInsets.fromLTRB(20.0, 20, 20.0, 5),
                      child: Align(
                        alignment: Alignment.center,
                      child:
                      CachedNetworkImage(
                        imageUrl: widget.tofastphoto()[0],
                        placeholder: (context, url) => Loadingcar(),



                      )

                        ,
                      )



                      ,
                    ),

                    Container(
                        padding: EdgeInsets.fromLTRB(10, 0.0, 0, 0),

                        width: 90,
                        height: 90,

                        child: CachedNetworkImage(

                          imageUrl: getphoto(),
                          placeholder: (context, url) => Loadingcar(),

                        )
                    ),
                  ],


                  ) ,

                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                    child: Text(
                      widget.cata["Meta: meta_title"],
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                    child: Text(
                      widget. cata["Categories"],
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                    child: Text(
                      widget. cata["Short description"],
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
                                .updatefavoritesData([{"name":widget.cata["Meta: meta_title"], "photo":widget.cata["ImagesList"][0],}]);
                          }
                          else {
                            setState(() {
                              alreadyclick= false;

                            });
                            await DataUser(uid: user.uid)
                                .removefavoritesData([{"name":widget.cata["Meta: meta_title"] , "photo":widget.cata["ImagesList"][0],}]);
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

