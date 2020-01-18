import 'package:catalytic_collector/models/parameter.dart';
import 'package:catalytic_collector/screens/home/search4.dart';
import 'package:catalytic_collector/services/databaseuser.dart';
import 'package:catalytic_collector/services/datapara.dart';
import 'package:catalytic_collector/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catalytic_collector/models/brew.dart';
import 'package:catalytic_collector/models/cata.dart';
import 'package:catalytic_collector/screens/home/brew_list.dart';
import 'package:catalytic_collector/screens/home/cata_list.dart';
import 'package:catalytic_collector/screens/home/droplist.dart';
import 'package:catalytic_collector/screens/home/setting_form1.dart';
import 'package:catalytic_collector/screens/home/test3.dart';
import 'package:catalytic_collector/services/auth1.dart';
import 'package:catalytic_collector/services/database2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'brand.dart';
import 'package:catalytic_collector/models/currencyuser.dart';
import 'package:catalytic_collector/services/data_currency.dart';
import 'package:catalytic_collector/models/User1.dart';
import 'package:catalytic_collector/shared/loading.dart';

class Final extends StatefulWidget {
  @override
  FinalState createState() => FinalState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(0, 'All'),
      Company(1, 'Mercedes'),
      Company(2, 'Mitsubishi'),
      Company(3, 'Suzuki'),
      Company(4, 'Nissan'),
      Company(5, 'kia/hyundai'),
      Company(6, 'ALFA ROMEO'),
      Company(7, 'Proton'),
      Company(8, 'Isuzu'),
      Company(9, 'Mini Cooper'),
      Company(10, 'BMW'),
      Company(11, 'Subaru'),
      Company(12, 'Toyota'),
      Company(13, 'Ford'),
      Company(14, 'Honda'),
      Company(15, 'Mazda'),
      Company(16, 'Volkswagen'),
      Company(17, 'Jaguar'),
      Company(18, 'Volvo'),
      Company(19, 'Walker'),
      Company(20, 'Psa'),
      Company(21, 'Daihatsu'),
      Company(22, 'NONE'),
      Company(23, 'AC-GM-OPEL'),
      Company(24, 'Renault'),
      Company(25, 'Perodua'),
      Company(26, 'chery/ssangyong'),
      Company(27, 'JEEP'),
      Company(28, 'Landrover'),
      Company(29, 'Chvrotlet'),
      Company(30, 'DAEWOO'),
      Company(31, 'Fiat'),
      Company(32, 'IVECO'),
      Company(33, 'Ferrari'),
      Company(34, 'Maserati'),
      Company(35, 'Porsche'),
      Company(36, 'Saab'),
      Company(37, 'Chraisler'),
      Company(38, 'Shahin'),
      Company(39, 'ALFA ROMIO'),
      Company(40, 'TOYTOA'),
    ];
  }
}

class FinalState extends State<Final> {
  final AuthService1 _auth = AuthService1();
  static String itemsearch = ""; // variable for searching about Item

  //
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  static String todata;
  int i = Brand.j;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[i].value;
    todata = _selectedCompany.name;
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

  void _showSettingsPanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingsForm1(),
          );
        });
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      todata = selectedCompany.name;
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    User1 user = Provider.of<User1>(context);


    return  StreamBuilder<UserData1>(
        stream: DataUser(uid: user.uid).userData,
    builder: (context, snapshot) {
    if(snapshot.hasData) {
      UserData1 userData = snapshot.data;
       String gotcountry = userData.country;
      return
        StreamProvider<List<Cata>>.value(
            value: DatabaseService2(toshorten: todata, searchitem: itemsearch)
                .catas,
            child: StreamProvider<List<Parameter>>.value(
                value: Datapara().paras,
                child: StreamProvider<List<Currencyuser>>.value(
                  value: Data_currency(gotcounty: gotcountry).currencies,
                  child: Scaffold(
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
                            onPressed: () => _showSettingsPanel(),
                          )
                        ],
                      ),
                      body: Column(
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: ListView(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                                shrinkWrap: true,
                                children: <Widget>[
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        hintText: "Enter your product name"),
                                    onChanged: (val) {
                                      setState(() => itemsearch = val);
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  DropdownButton(
                                    value: _selectedCompany,
                                    items: _dropdownMenuItems,
                                    onChanged: onChangeDropdownItem,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/Stone.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: CataList()),
                          )
                        ],
                      )),
                )));
    }
    else{
      return Loading();
    }

        });
  }
}
