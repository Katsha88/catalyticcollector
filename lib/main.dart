import 'package:catalytic_collector/models/User1.dart';
import 'package:catalytic_collector/screens/wrapper.dart';
import 'package:catalytic_collector/services/auth1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User1>.value(
      value: AuthService1().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}