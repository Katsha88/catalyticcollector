import 'package:catalytic_collector/models/User1.dart';
import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalytic_collector/models/userq.dart';

class DataUser {

  final String uid;

  DataUser({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future<void> updateUserData(String email, String name, String phone) async {
    return await brewCollection.document(uid).setData({
      'email': email,
      'name': name,
      'phone': phone,
    });
  }

  // brew list from snapshot
  List<Userq> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Userq(
          name: doc.data['name'] ?? '',
          email: doc.data['email'] ?? '',
          phone: doc.data['phone'] ?? ''
      );
    }).toList();
  }

  // user data from snapshots
  UserData1 _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData1(
        uid: uid,
        name: snapshot.data['name'],
        email: snapshot.data['email'],
        phone: snapshot.data['phone']
    );
  }

  // get brews stream
  Stream<List<Userq>> get brews {
    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData1> get userData {
    return brewCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}