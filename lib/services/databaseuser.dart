import 'package:catalytic_collector/models/User1.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalytic_collector/models/userq.dart';
import 'package:provider/provider.dart';

class DataUser {

  final String uid;

  DataUser({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('Users');

  Future<void> updateUserData(String email, String name, String phone, String country, var sell) async {
    return await brewCollection.document(uid).setData({
      'email': email,
      'name': name,
      'phone': phone,
      'country': country,
      'sell': sell
    });
  }
  Future<void> updatesellData(var sell) async {
    return await brewCollection.document(uid).updateData({

      'sell': FieldValue.arrayUnion(sell)
    });
  }


  // brew list from snapshot

  // user data from snapshots

  UserData1 _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData1(
        uid: uid,
        name: snapshot.data['name']??"",
        email: snapshot.data['email']??"",
        phone: snapshot.data['phone']??"",
      country : snapshot.data['country']??"",
      sell : snapshot.data ['sell']??""
    );
  }

  // get brews stream


  // get user doc stream
  Stream<UserData1> get userData {
    return brewCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

  Stream<UserData1> get getcountry {
    return brewCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}