import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catalytic_collector/services/databaseuser.dart';
import 'package:catalytic_collector/screens/home/showimage.dart';

class Itempage3 extends StatefulWidget {
  List photo;
  String name;
  String brand;
  String description;
  String price;
  String symbol;

  Itempage3({this.photo, this.name, this.brand, this.description, this.price,this.symbol});


  @override
  Itempage3State createState() => Itempage3State();
}

class Itempage3State extends State<Itempage3> {
   var _itemCount= 0;
   var total ;

  @override

  Widget build(BuildContext context) {
    if (_itemCount==0){
      total= widget.price;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Selling page"),
        ),
        body: ListView(
          children: <Widget>[
            new CarouselSlider(
                items: widget.photo.map((i) {
                  return new Builder(
                    builder: (BuildContext context) {
                      return new Container(
                          padding: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width,
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          child : GestureDetector(
                            child: new Image.network(
                              i,
                              fit: BoxFit.fill,
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Showimage(url :i)));
                            },
                          )




                      );
                    },
                  );
                }).toList(),
                enableInfiniteScroll: false,
                autoPlay: true,
                enlargeCenterPage: true),
            Container(

              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
              child: Text(

                widget.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
              child: Text(
                widget.brand,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
              child: Text(
                widget.symbol + " "+ total,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                _itemCount != 0 ? new IconButton(icon: new Icon(Icons.remove), onPressed: () => setState((){

                  _itemCount--;
                  total= (_itemCount*double.parse(widget.price)).toStringAsFixed(1);

                }),) : new Container(),
                new Text(_itemCount.toString()),
                new IconButton(
                    icon: new Icon(Icons.add),
                    onPressed: () => setState(() {
                      _itemCount++;
                      total= (_itemCount*double.parse(widget.price)).toStringAsFixed(1);




                    }))
              ],
            )),
            Container(
                padding: EdgeInsets.fromLTRB(40, 0.0, 40, 5),
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
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        );

                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: Text(widget.brand),
                          content: Text(
                              "Your item:${widget.name} is added for selling"),
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

                      await DataUser(uid: user.uid)
                          .updatesellData([{"name":widget.name , "number": _itemCount , "photo":widget.photo[0], "price":widget.price}]);
                      showAlertDialog(context);
                    })),
          ],
        ));
  }
}
