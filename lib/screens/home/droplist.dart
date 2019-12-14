import 'package:catalytic_collector/screens/home/search4.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  static String fromshroten ;

  @override
  FinalState createState() => FinalState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(0,'All'),
      Company(1,'Mercedes'),
      Company(2,'Mitsubishi'),
      Company(3,'Suzuki'),
      Company(4,'Nissan'),
      Company(5,'kia/hyundai'),
      Company(6,'ALFA ROMEO'),
      Company(7,'Proton'),
      Company(8,'Isuzu'),
      Company(9,'Mini Cooper'),
      Company(10,'BMW'),
      Company(11,'Subaru'),
      Company(12,'Toyota'),
      Company(13,'Ford'),
      Company(14,'Honda'),
      Company(15,'Mazda'),
      Company(16,'Volkswagen'),
      Company(17,'Jaguar'),
      Company(18,'Volvo'),
      Company(19,'Walker'),
      Company(20,'Psa'),
      Company(21,'Daihatsu'),
      Company(22,'NONE'),
      Company(23,'AC-GM-OPEL'),
      Company(24,'Renault'),
      Company(25,'Perodua'),
      Company(26,'chery/ssangyong'),
      Company(27,'JEEP'),
      Company(28,'Landrover'),
      Company(29,'Chvrotlet'),
      Company(30,'DAEWOO'),
      Company(31,'Fiat'),
      Company(32,'IVECO'),
      Company(33,'Ferrari'),
      Company(34,'Maserati'),
      Company(35,'Porsche'),
      Company(36,'Saab'),
      Company(37,'Chraisler'),
      Company(38,'Shahin'),
      Company(39,'ALFA ROMIO'),
      Company(40,'TOYTOA'),



    ];
  }
}

class FinalState extends State<DropDown> {



  //
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    DropDown.fromshroten = "All";
        super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      DropDown.fromshroten = selectedCompany.name;
      _selectedCompany = selectedCompany;


    });
  }

  @override
  Widget build(BuildContext context) {


    return new Container(
      child: Center(
        child: Column(


          children: <Widget>[
            Text(DropDown.fromshroten),
            SizedBox(
              height: 20.0,
            ),
            DropdownButton(
              value: _selectedCompany,
              items: _dropdownMenuItems,
              onChanged: onChangeDropdownItem,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('Selected: ${_selectedCompany.name}'),
            Flexible(
              child:             Search4(brave: DropDown.fromshroten,),
            )


          ],
        ),
      ),
    );



  }
}