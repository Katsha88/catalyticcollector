import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalytic_collector/models/brandclass.dart';

class Databrand {
  final CollectionReference BrandCollection =
      (Firestore.instance.collection('Brand'));

  List<Brandclass> _cataListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      String a = doc.data["Link"];
 a.replaceAll("http://", "https://");

 a.replaceAll("https://", "https://i0.wp.com/");

      //print(doc.data);
      return Brandclass(
        name: doc.data['Brand'] ?? "0",
        photo: a  ?? "0",
      );
    }).toList();
  }

  Stream<List<Brandclass>> get bradfrom {
    return BrandCollection.orderBy("Brand")
        .snapshots()
        .map(_cataListFromSnapshot);
  }
}
