import 'package:catalytic_collector/models/User1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalytic_collector/models/currencyuser.dart';
import 'package:provider/provider.dart';
import 'package:catalytic_collector/screens/home/setting_form1.dart';
import 'package:catalytic_collector/services/databaseuser.dart';
import 'package:flutter/material.dart';
import 'package:catalytic_collector/screens/home/final.dart';



class Data_currency    {

final String gotcounty;
Data_currency({this.gotcounty});
  // collection reference
  final CollectionReference paraCollection = (Firestore.instance.collection('Currency'));



  List<Currencyuser> _paraistFromSnapshot(QuerySnapshot snapshot) {

    return snapshot.documents.map((doc){
      //print(doc.data);
      return Currencyuser(

        country: doc.data['Country'] ?? "",
        symbol: doc.data['Currency Symbol'] ?? "",
        exrate :doc.data['Ex. Rate'] ?? 0,
        profiterate :doc.data['Pofit Rate'] ?? 0,
        subscription: doc.data['Subscription'] ?? 0


      );
    }).toList();

  }




  // user data from snapshots


  Stream<List<Currencyuser>> get currencies {
    return paraCollection.where("Country", isEqualTo: gotcounty)
        .snapshots()
        .map(_paraistFromSnapshot);

// get user doc stream

  }

Stream<List<Currencyuser>> get currenciesall {

  return paraCollection.snapshots()
      .map(_paraistFromSnapshot);

// get user doc stream



}

}