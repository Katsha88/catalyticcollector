import 'package:catalytic_collector/models/User1.dart';
import 'package:catalytic_collector/screens/authenticate/authenticate.dart';
import 'package:catalytic_collector/screens/template.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User1>(context);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Template();
    }
    
  }
}