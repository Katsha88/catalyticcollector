import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  final String searchitem; // for searching about item
  final String toshorten;


  FirebaseProvider({this.toshorten, this.searchitem, });



  Future<List<DocumentSnapshot>> fetchFirstList() async {


    return (await Firestore.instance
        .collection("Items")
        .orderBy("Meta: meta_title")
        .limit(10)
        .getDocuments())
        .documents;



  }

  Future<List<DocumentSnapshot>> fetchNextList(
      List<DocumentSnapshot> documentList) async {
        return (await Firestore.instance
            .collection("Items")
            .startAfterDocument(documentList[documentList.length - 1])
            .limit(10)
            .orderBy("Meta: meta_title")
            .getDocuments())
            .documents;

  }

  Future<List<DocumentSnapshot>> fetchEntryList(String l, String k) async {
    print(l);
print(k);
if (k == "All") {
  return (await Firestore.instance
      .collection("Items")
      .orderBy("Meta: meta_title")
      .startAt([l])
      .endAt([l + '\uf8ff'])
      .limit(20)
      .getDocuments())
      .documents;
}

else{
  return (await Firestore.instance
      .collection("Items")
  .where("Categories", isEqualTo: k)
      .orderBy("Meta: meta_title")
      .startAt([l])
      .endAt([l + '\uf8ff'])
      .limit(20)
      .getDocuments())
      .documents;


}

  }

}