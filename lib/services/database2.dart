import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService2 {



  // collection reference
  final CollectionReference brewCollection = (Firestore.instance.collection('Items'));

  List<Cata> _cataListFromSnapshot(QuerySnapshot snapshot) {

    return snapshot.documents.map((doc){
      String g = doc.data["Images1"];
      g =  g = g.replaceAll("https://", "https://i0.wp.com/");
      //print(doc.data);
      return Cata(
          name: doc.data['Name'] ?? "0",
          categories: (doc.data['Categories']) ?? '0',
          description: doc.data["Short description"] ?? '0',
        images: g ?? "https://image.shutterstock.com/image-vector/no-photography-video-260nw-1161043789.jpg"

      );
    }).toList();
  }


  // user data from snapshots

  Stream<List<Cata>> get catas {
    return brewCollection.where("Categories",isEqualTo:"Volkswagen" ).snapshots()
        .map(_cataListFromSnapshot);
  }


  // get user doc stream


}