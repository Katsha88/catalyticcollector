import 'package:flutter/material.dart';
import 'home/home.dart';
import 'home/search.dart';
import 'home/about.dart';
import 'home/contact.dart';


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class Template extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TemplateState();
  }
}
class TemplateState extends State<Template> {
  int _selectedTab = 0;
  final _pageOptions = [
Search(), About(), Contact()

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.indigo,
          type: BottomNavigationBarType.fixed,



          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('About us'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('INDUSTRIAL CATALYST'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              title: Text('Contact us'),
            ),
          ],
        ),
      ),
    );
  }}