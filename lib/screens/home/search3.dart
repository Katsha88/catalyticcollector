
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:catalytic_collector/models/note.dart';
import 'package:http/http.dart' as http;
import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/cata.dart';

import 'package:catalytic_collector/screens/home/brew_list.dart';
import 'package:catalytic_collector/screens/home/cata_list.dart';
import 'package:catalytic_collector/screens/home/settings_form.dart';
import 'package:catalytic_collector/services/auth.dart';
import 'package:catalytic_collector/services/database2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Search3 extends StatefulWidget {


  @override
  _Search3State createState() => _Search3State();
}

class _Search3State extends State<Search3> {

  final AuthService _auth = AuthService();
  List<Note> _notes = List<Note>();

  Future<List<Note>> fetchNotes() async {
    var url = 'https://raw.githubusercontent.com/Katsha88/Json/master/data.json';
    var response = await http.get(url);

    var notes = List<Note>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Catalytic Collector'),
          backgroundColor: Colors.lightBlue,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => print("on press"),
            )
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
           String x= _notes[index].images;
           x=x.replaceAll("https://", "https://i0.wp.com/");


            return Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Image.network(x.substring(0, ( x.indexOf(",")== -1? x.length:x.indexOf(","))


                ))

                    ,


                    Text(
                        _notes[index].name??'default value',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      _notes[index].categories??'default value',
                      style: TextStyle(
                          color: Colors.grey.shade600
                      ),
                    ),
                    Text(
                      _notes[index].description??'default value',
                      style: TextStyle(
                          color: Colors.grey.shade600
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
          itemCount: _notes.length,
        )
    );
  }
}