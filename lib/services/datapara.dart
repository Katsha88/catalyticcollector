import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalytic_collector/models/parameter.dart';



class Datapara{






  // collection reference
  final CollectionReference paraCollection = (Firestore.instance.collection('MetalPrice'));


  List<Parameter> _paraistFromSnapshot(QuerySnapshot snapshot) {

    return snapshot.documents.map((doc){
      //print(doc.data);
      return Parameter(

        pd1: doc.data['PD'] ?? 0,
        pt1: doc.data['PT'] ?? 0,
        rh1 :doc.data['RH'] ?? 0,


      );
    }).toList();

}


  // user data from snapshots

  Stream<List<Parameter>> get paras {

    return paraCollection.snapshots()
        .map(_paraistFromSnapshot);

// get user doc stream



}}