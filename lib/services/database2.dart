import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService2 {



  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('Items');

  List<Cata> _cataListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Cata(
          name: doc.data['Name'] ?? "0",
          categories: doc.data['Categories'] ?? '0',
          description: doc.data["Short description"] ?? '0',
          images: doc.data['Images'] ?? '0'
      );
    }).toList();
  }


  // user data from snapshots

  Stream<List<Cata>> get catas {
    return brewCollection.snapshots()
        .map(_cataListFromSnapshot);
  }


  // get user doc stream


}