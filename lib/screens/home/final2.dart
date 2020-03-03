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
import 'package:flutter/services.dart';
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
import 'package:catalytic_collector/screens/home/brandgrid.dart';
import 'package:catalytic_collector/models/branduser.dart';
import 'package:catalytic_collector/services/data_barnd.dart';

class Final2 extends StatefulWidget {
  @override
  Final2State createState() => Final2State();
}

class Final2State extends State<Final2> {
  final AuthService1 _auth = AuthService1();
  static String itemsearch = "";

  bool check = true;
  String currentbrand ;

  Company _selectedCompany;
  static String todata;
  String i = BrandgridState.j;

  // variable for searching about Item
  void choiceAction(String choice) {
    if (choice == Threedots.Settings) {
      _showSettingsPanel();
    } else if (choice == Threedots.My_favorite) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Favorites()));
    } else if (choice == Threedots.Product_for_sell) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Itemtoshow()));
    } else if (choice == Threedots.SignOut) {
      _auth.signOut();
    }
  }

  @override
  void initState() {
    if (i != "All"){
      currentbrand = i;
    }else {
      currentbrand = "All";
    }


    super.initState();
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

  @override
  Widget build(BuildContext context) {
    User1 user = Provider.of<User1>(context);


    return StreamBuilder<UserData1>(
        stream: DataUser(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData1 userData = snapshot.data;
            String gotcountry = userData.country;
            List gotfavoirtes = userData.favorites;
            print("call in fainal");

            return StreamBuilder<List<Branduser>>(
                stream: Data_brand().brandall,
                builder: (context, snapshot1) {

                  if (snapshot1.hasData) {
                    List<Branduser> companies = snapshot1.data;
                    List<DropdownMenuItem> companyItems = [];
                    String l= controllertext.text.toUpperCase();
                    String j = l.replaceAll(new RegExp(r"[^A-Za-z0-9]"), "");

                    companyItems.add(
                      DropdownMenuItem(
                        child: Text(
                          "All",
                          style: TextStyle(color: Colors.blue),
                        ),
                        value: "${"All"}",
                      ),
                    );


                    for (int i = 0; i < companies.length; i++) {

                      companyItems.add(
                        DropdownMenuItem(
                          child: Text(
                            companies[i].name,
                            style: TextStyle(color: Colors.blue),
                          ),
                          value: "${companies[i].name}",
                        ),
                      );
                    }

                    return StreamProvider<List<Parameter>>.value(
                        value: Datapara().paras,
                        child: StreamProvider<List<Currencyuser>>.value(
                          value:
                              Data_currency(gotcounty: gotcountry).currencies,
                          child: Scaffold(
                              backgroundColor: Colors.brown[50],
                              appBar: AppBar(
                                title: Text('Catalytic Collector'),
                                backgroundColor: Colors.lightBlue,
                                elevation: 0.0,
                                actions: <Widget>[
                                  PopupMenuButton<String>(
                                    onSelected: choiceAction,
                                    itemBuilder: (BuildContext context) {
                                      return Threedots.choices
                                          .map((String choice) {
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
                                        padding:
                                            EdgeInsets.fromLTRB(20, 20, 20, 5),
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: TextFormField(





                                                  decoration: textInputDecoration
                                                      .copyWith(
                                                          hintText:
                                                              "Enter your product name"),
                                                  autocorrect: false,

                                                  controller: controllertext,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: DropdownButton(
                                                  value: currentbrand,
                                                  items: companyItems,
                                                  onChanged: (currencyValue) {
                                                    setState(() {
                                                      currentbrand =
                                                          currencyValue;
                                                      BrandgridState.j= currencyValue;

                                                      movieListBloc
                                                          .fetchOnEntry(
                                                              j,
                                                              currentbrand);
                                                    });
                                                  },
                                                  //   onChanged: onChangeDropdownItem,
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
                                            image:
                                                AssetImage('assets/Stone.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: CataList(
                                          companies: companies,
                                            favorites: gotfavoirtes,
                                            todata: currentbrand,
                                            itemsearch: itemsearch)),
                                  )
                                ],
                              )),
                        ));
                  } else {
                    return Loading();
                  }
                });
          } else {
            return Loading();
          }
        });
  }


}
