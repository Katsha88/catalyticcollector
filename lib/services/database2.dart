import 'dart:math';

import 'package:catalytic_collector/models/cata.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';
import 'package:catalytic_collector/screens/home/final.dart';
import 'package:catalytic_collector/models/parameter.dart';

class DatabaseService2 {
  final String searchitem; // for searching about item
  final String toshorten;


  DatabaseService2({this.toshorten, this.searchitem, });

  // collection reference
  final CollectionReference brewCollection =
      (Firestore.instance.collection('Items'));
  bool _loadingproduct = true;
  List <DocumentSnapshot> _product = [];
  DocumentSnapshot _lastdocument;
int total=3;

  List<Cata> _cataListFromSnapshot(QuerySnapshot snapshot) {

    return snapshot.documents.map((doc) {
      List a = doc.data["ImagesList"];
      List g = [];
      for (var i = 0; i < a.length; i++) {
        g.add(a[i].replaceAll("https://", "https://i0.wp.com/"));
      }

      //print(doc.data);
      return Cata(
        name: doc.data['Meta: meta_title'] ?? "0",
        categories: (doc.data['Categories']) ?? '0',
        description: doc.data["Short description"] ?? '0',
        images: g ?? [""],
        parameter: doc.data['parameter'] ?? [],
      );
    }).toList();
  }

  // user data from snapshots

  Stream<List<Cata>> get catas {

    if (toshorten == "All") {
      if (searchitem == "") {

        return brewCollection
            .orderBy("Meta: meta_title")
            .limit(total)
            .snapshots()
            .map(_cataListFromSnapshot);

      } else {
        return brewCollection
            .orderBy("Meta: meta_title")
            .startAt([searchitem])
            .endAt([searchitem + '\uf8ff'])
            .limit(total)
            .snapshots()
            .map(_cataListFromSnapshot);
      }
    } else {
      if (searchitem == "") {
        return brewCollection
            .orderBy("Meta: meta_title")
            .where("Categories", isEqualTo: toshorten)
            .limit(total)
            .snapshots()
            .map(_cataListFromSnapshot);
      } else {
        return brewCollection
            .where("Categories", isEqualTo: toshorten)
            .startAt([searchitem])
            .endAt([searchitem + '\uf8ff'])
            .orderBy('Meta: meta_title')
            .limit(total)
            .snapshots()
            .map(_cataListFromSnapshot);
      }
    }
  }
  Stream<List<Cata>>  get catasthen {

    if (toshorten == "All") {
      if (searchitem == "") {

        return brewCollection
            .orderBy("Meta: meta_title")
            .limit(total+10)
            .snapshots()
            .map(_cataListFromSnapshot);

      } else {
        return brewCollection
            .orderBy("Meta: meta_title")
            .startAt([searchitem])
            .endAt([searchitem + '\uf8ff'])
            .limit(total+10)
            .snapshots()
            .map(_cataListFromSnapshot);
      }
    } else {
      if (searchitem == "") {
        return brewCollection
            .orderBy("Meta: meta_title")
            .where("Categories", isEqualTo: toshorten)
            .limit(total+10)
            .snapshots()
            .map(_cataListFromSnapshot);
      } else {
        return brewCollection
            .where("Categories", isEqualTo: toshorten)
            .startAt([searchitem])
            .endAt([searchitem + '\uf8ff'])
            .orderBy('Meta: meta_title')
            .limit(total+10)
            .snapshots()
            .map(_cataListFromSnapshot);
      }
    }
  }


// get user doc stream

}
