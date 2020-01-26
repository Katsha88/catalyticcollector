import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Itempage3 extends StatefulWidget{


  List photo;
  String name;
  String brand;
  String description;
  String price;

  Itempage3({this.photo,this.name,this.brand,this.description,this.price});




  @override

  Itempage3State createState() => Itempage3State();




}
class  Itempage3State extends State<Itempage3> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Selling page"),
      ) ,
      body:
          Column(
            children: <Widget>[
              new CarouselSlider(
                  items: widget.photo.map((i) {
                    return new Builder(
                      builder: (BuildContext context) {
                        return new Container(
                            padding: EdgeInsets.only(top: 20),
                            width: MediaQuery.of(context).size.width,
                            margin: new EdgeInsets.symmetric(horizontal: 5.0),

                            child: new Image.network(i,fit: BoxFit.fill,)
                        );
                      },
                    );
                  }).toList(),
                  enableInfiniteScroll:false,
                  autoPlay: true,
                  enlargeCenterPage:true
              )
              ,
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5),
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),



            ],
          )







    );

  }

}