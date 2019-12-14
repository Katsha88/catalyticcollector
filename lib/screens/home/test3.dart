import 'package:flutter/material.dart';


class Test3 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Test3State();
  }
}

class _Test3State extends State<Test3> {

  var _currencies = ['All',
    'Mercedes',
    'Mitsubishi',
    'Suzuki',
    'Nissan',
    'kia/hyundai',
    'ALFA ROMEO',
    'Proton',
    'Isuzu',
    'Mini Cooper',
    'BMW',
    'Subaru',
    'Toyota',
    'Ford',
    'Honda',
    'Mazda',
    'Volkswagen',
    'Jaguar',
    'Volvo',
    'Walker',
    'Psa',
    'Daihatsu',
    'NONE',
    'AC-GM-OPEL',
    'Renault',
    'Perodua',
    'chery/ssangyong',
    'JEEP',
    'Landrover',
    'Chvrotlet',
    'DAEWOO',
    'Fiat',
    'IVECO',
    'Ferrari',
    'Maserati',
    'Porsche',
    'Saab',
    'Chraisler',
    'Shahin',
    'ALFA ROMIO',
    'TOYTOA',
  ];
  var _currentItemSelected = 'All';

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),

              onChanged: (String newValueSelected) {
                // Your code to execute, when a menu item is selected from drop down
                _onDropDownItemSelected(newValueSelected);
              },

              value: _currentItemSelected,

            ),

          ],
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}






