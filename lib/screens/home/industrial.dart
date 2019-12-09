import 'package:catalytic_collector/models/brew.dart';

import 'package:catalytic_collector/screens/home/brew_list.dart';
import 'package:catalytic_collector/screens/home/settings_form.dart';
import 'package:catalytic_collector/services/auth.dart';
import 'package:catalytic_collector/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Industrial extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('INDUSTRIAL CATALYST'),
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
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,

            child: Text("THE STORY BEHIND CALATALYTIC COLLECTORS Catalytic Collector, we have been working on Industrial Catalyst and catalytic converter since 2005. Evaluating of Industrial Catalyst materials fairly is a considerable challenge. Catalytic collectors operates as one of the world’s largest precious metals recycling facilities. This business unit of Unicorn is the world market leader in recycling complex waste streams containing precious and other non-ferrous metals. We buy industrial catalysts and offer eco-efficient recycling and refining services for precious metal bearing materials (consumer and industrial recyclable products (e.g. electronic scrap, spent auto catalysts , spent industrial catalysts, sweeps and bullions). catalytic collectores operates as one of the world’s largest precious metals recycling facilities. we buy industrial catalysts and catalytic converters and offer eco-efficient recycling and refining services for precious metal bearing materials (consumer and industrial recyclable products (e.g. electronic scrap, spent auto catalysts , spent industrial catalysts, sweeps and bullions). Histories of catalysis have been told by others from different perspectives. This manuscript highlights key catalytic discoveries that led to commercialized, industrial processes. The intent to show how catalysis evolved over the last 250 years into major industries focused not only at catalyst production, but also significantly impacting the production of commodity, specialty and fine chemicals, as well as petrochemical, petroleum, emissions control, and polymerization. For centuries before 1750, catalysts were used to make beverages and foods. One sees that the Lead Chamber process for the production of sulfuric acid is among the earliest of catalytic processes and reaches back to 1750Pursuit of a sound fundamental understanding of catalysis in the 19th century, led to the application of these materials to a variety of basic chemicals. The development of petroleum fuels led to a vast petrochemicals business which in turn fed a growth in specialty and performance chemicals. New drivers in the 20th century from the transportation and the environmental business sectors provided market pull to bring about more catalytic solutions for more industries. The often novel, catalytic properties of zeolites created new commercial applications, while environmental legislation created market pull to use catalysis to meet the new regulatory standards. As we move forward into the new century, we continue to see market pull from growing interests in biomass, sustainability, emissions control, and energy. T<Sou rakan M7 he first time a catalyst was used in the industry was in 1746 by J. Hughes in the manufacture of lead chamber sulfuric acid. Since then catalysts have been in use in a large portion of the chemical industry. In the start only pure components were used as catalysts, but after the year 1900 multicomponent catalysts were studied and are now commonly used in the industry. In the chemical industry and industrial research, catalysis play an important role. Different catalysts are in constant development to fulfil economic, political and environmental demands. When using a catalyst, it is possible to replace a polluting chemical reaction with a more environmentally friendly alternative. Today, and in the future, this can be vital for the chemical industry. In addition, it’s important for a company/researcher to pay attention to market development. If a company’s catalyst is not continually improved, another company can make progress in research on that particular catalyst and gain market share. For a company, a new and improved catalyst can be a huge advantage for a competitive manufacturing cost. It’s extremely expensive for a company to shut down the plant because of an error in the catalyst, so the correct selection of a catalyst or a new improvement can be key to industrial success."
              ,  style: TextStyle(
                fontWeight: FontWeight.bold,


              ),
            )

        ),
      ),
    );
  }
}