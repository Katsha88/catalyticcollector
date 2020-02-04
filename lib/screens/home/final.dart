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
import 'package:catalytic_collector/shared/threedots.dart';
import 'package:catalytic_collector/screens/home/itemtoshow.dart';
import 'package:catalytic_collector/screens/home/favorites.dart';
import 'package:catalytic_collector/screens/home/cata_list.dart';
import 'package:catalytic_collector/screens/home/bloc.dart';

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
      Company(0,'All'),
      Company(1,'ALFA ROMEO'),
      Company(2,'BMW'),
      Company(3,'chery/ssangyong'),
      Company(4,'Chraisler'),
      Company(5,'Chvrotlet'),
      Company(6,'DAEWOO'),
      Company(7,'Daihatsu'),
      Company(8,'Ferrari'),
      Company(9,'Fiat'),
      Company(10,'Ford'),
      Company(11,'GM'),
      Company(12,'Honda'),
      Company(13,'Isuzu'),
      Company(14,'IVECO'),
      Company(15,'Jaguar'),
      Company(16,'JEEP'),
      Company(17,'kia/hyundai'),
      Company(18,'Landrover'),
      Company(19,'Maserati'),
      Company(20,'Mazda'),
      Company(21,'Mercedes'),
      Company(22,'Mini Cooper'),
      Company(23,'Mitsubishi'),
      Company(24,'Nissan'),
      Company(25,'Perodua'),
      Company(26,'Porsche'),
      Company(27,'Proton'),
      Company(28,'Psa'),
      Company(29,'Renault'),
      Company(30,'Saab'),
      Company(31,'Shahin'),
      Company(32,'Subaru'),
      Company(33,'Suzuki'),
      Company(34,'Toyota'),
      Company(35,'TOYTOA'),
      Company(36,'Volkswagen'),
      Company(37,'Volvo'),
      Company(38,'Walker'),

    ];
  }
}

class FinalState extends State<Final> {
  final AuthService1 _auth = AuthService1();
  static String itemsearch = "";


  // variable for searching about Item
  void choiceAction(String choice){
    if(choice == Threedots.Settings){
      _showSettingsPanel();
    }else if(choice == Threedots.My_favorite){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Favorites()
          ));
    }else if(choice == Threedots.Product_for_sell){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Itemtoshow()
          ));
    }
    else if(choice == Threedots.SignOut) {
       _auth.signOut();
    }
  }

  //
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  static String todata;
  int i = Brand.j;
  int total1;


  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[i].value;
    todata = _selectedCompany.name;
    total1 =0;


    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,

          child: Text(company.name,

          ),
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
      movieListBloc.fetchOnEntry(itemsearch, todata);
    }


    );
  }

  @override
  Widget build(BuildContext context) {
    print("number of call");
    total1 = total1 +5;
    print("d");
    User1 user = Provider.of<User1>(context);

    return StreamBuilder<UserData1>(
        stream: DataUser(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData1 userData = snapshot.data;
            String gotcountry = userData.country;
            List gotfavoirtes = userData.favorites;
            print("call in fainal");



            return  StreamProvider<List<Parameter>>.value(
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
                              PopupMenuButton<String>(
                                onSelected: choiceAction,
                                itemBuilder: (BuildContext context){
                                  return Threedots.choices.map((String choice){
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(choice),
                                    );
                                  }).toList();
                                },
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
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: TextFormField(
                                              decoration:
                                                  textInputDecoration.copyWith(
                                                      hintText:
                                                          "Enter your product name"),
                                              controller: controllertext,

                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: DropdownButton(
                                              value: _selectedCompany,
                                              items: _dropdownMenuItems,

                                              onChanged: onChangeDropdownItem,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.0,
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
                                    child: CataList(favorites: gotfavoirtes,todata: todata,itemsearch: itemsearch)),
                              )
                            ],
                          )),
                    ));
          } else {
            return Loading();
          }
        });
  }
}
