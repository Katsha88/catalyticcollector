import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalytic_collector/services/FirebaseProvider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:provider/provider.dart';

class MovieListBloc {
  final String searchitem; // for searching about item
  final String toshorten;

  FirebaseProvider firebaseProvider;

  bool showIndicator = false;
  List<DocumentSnapshot> documentList;
  List<DocumentSnapshot>  documentEntry;


  BehaviorSubject<List<DocumentSnapshot>> movieController;
  ReplaySubject <List<DocumentSnapshot>> entry;

  BehaviorSubject<bool> showIndicatorController;

  MovieListBloc({this.toshorten, this.searchitem}) {
    entry= ReplaySubject <List<DocumentSnapshot>>();
        movieController = BehaviorSubject<List<DocumentSnapshot>>();
    showIndicatorController = BehaviorSubject<bool>();
    firebaseProvider =
        FirebaseProvider(toshorten: toshorten, searchitem: searchitem);
  }

  Stream get getShowIndicatorStream => showIndicatorController.stream;

  Stream<List<DocumentSnapshot>> get movieStream => movieController.stream;

/*This method will automatically fetch first 10 elements from the document list */
  Future fetchFirstList() async {
    try {
      documentList = await firebaseProvider.fetchFirstList();
      print(documentList);

      movieController.sink.add(documentList);
      try {
        if (documentList.length == 0) {
          movieController.sink.addError("No Data Available");
        }
      } catch (e) {}
    } on SocketException {
      movieController.sink.addError(SocketException("No Internet Connection"));
    } catch (e) {
      print(e.toString());
      movieController.sink.addError(e);
    }
  }

  /*This method will  fetch first 10 elements depends on entry from the document list */
  Future fetchOnEntry(String l , String k) async {
    try {

      documentList = await firebaseProvider.fetchEntryList(l,k);
      print("it is fetch depends on entry");
      movieController.sink.add(documentList);


      try {
        if (documentList.length == 0) {
          movieController.sink.addError("No Data Available");
        }
      } catch (e) {}
    } on SocketException {
      movieController.sink.addError(SocketException("No Internet Connection"));
    } catch (e) {
      print(e.toString());
      movieController.sink.addError(e);
    }
  }

/*This will automatically fetch the next 10 elements from the list*/
  fetchNextMovies(String l ,String k) async {
    try {
      updateIndicator(true);
      List<DocumentSnapshot> newDocumentList =
          await firebaseProvider.fetchNextList(documentList,l, k);
      documentList.addAll(newDocumentList);
      movieController.sink.add(documentList);
      try {
        if (documentList.length == 0) {
          movieController.sink.addError("No Data Available");
          updateIndicator(false);
        }
      } catch (e) {
        updateIndicator(false);
      }
    } on SocketException {
      movieController.sink.addError(SocketException("No Internet Connection"));
      updateIndicator(false);
    } catch (e) {
      updateIndicator(false);
      print(e.toString());
      movieController.sink.addError(e);
    }
  }


/*For updating the indicator below every list and paginate*/
  updateIndicator(bool value) async {
    showIndicator = value;
    showIndicatorController.sink.add(value);
  }

  void dispose() {
    movieController.close();
    showIndicatorController.close();
  }
}
