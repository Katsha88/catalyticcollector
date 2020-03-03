import 'package:catalytic_collector/models/User1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalytic_collector/models/currencyuser.dart';
import 'package:provider/provider.dart';
import 'package:catalytic_collector/screens/home/setting_form1.dart';
import 'package:catalytic_collector/services/databaseuser.dart';
import 'package:flutter/material.dart';
import 'package:catalytic_collector/screens/home/final.dart';
import 'package:catalytic_collector/models/branduser.dart';



class Data_brand    {


  // collection reference
  final CollectionReference paraCollection = (Firestore.instance.collection('Brand'));



  List<Branduser> _paraistFromSnapshot(QuerySnapshot snapshot) {

    return snapshot.documents.map((doc){
      String a = doc.data["Link"];
      a.replaceAll("http://", "https://");

      a.replaceAll("https://", "https://i0.wp.com/");


      //print(doc.data);
      return Branduser(

          name: doc.data['Brand'] ?? "",
          photo: a ?? "",



      );
    }).toList();

  }




  // user data from snapshots



  Stream<List<Branduser>> get brandall {

    return paraCollection.orderBy("Brand").snapshots()
        .map(_paraistFromSnapshot);

// get user doc stream



  }

}