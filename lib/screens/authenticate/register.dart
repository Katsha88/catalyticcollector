import 'package:catalytic_collector/services/auth1.dart';
import 'package:catalytic_collector/shared/constants.dart';
import 'package:catalytic_collector/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final AuthService1 _auth = AuthService1();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String name = '';
  String email = '';
  String password = '';
  String phone = '';
  String country = '';
  var sell = [];
  var favorites = [];
  Future <String> helplocation;

  TextEditingController _textEditingController;


  @override
  initState() {
    helplocation = getLocation();

    super.initState();
  }

  final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  Future <String> getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> p = await geolocator.placemarkFromCoordinates(
        position.latitude, position.longitude);
    Placemark place = p[0];
    country = "${place.country}";
     _textEditingController= TextEditingController(text: country);
    return country;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: helplocation,
        builder: (context, snapshot) {
          String fortext = snapshot.data;

          return loading
              ? Loading()
              : Scaffold(
            backgroundColor: Colors.white30,
            appBar: AppBar(
              backgroundColor: Colors.lightBlue,
              elevation: 0.0,
              title: Text('Sign up to Catalytic Collector'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),
            body: Container(
              padding:
              EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: ListView(
                    children: <Widget>[
                    SizedBox(height: 20.0),
                TextFormField(
                  decoration:
                  textInputDecoration.copyWith(hintText: 'name'),
                  validator: (val) =>
                  val.isEmpty ? 'Enter your name' : null,
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration:
                  textInputDecoration.copyWith(hintText: 'email'),
                  validator: (val) =>
                  val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration:
                  textInputDecoration.copyWith(hintText: 'Phone'),
                  validator: (val) =>
                  val.isEmpty ? 'Enter an Phone' : null,
                  onChanged: (val) {
                    setState(() => phone = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'password'),
                  obscureText: true,
                  validator: (val) =>
                  val.length < 6
                      ? 'Enter a password 6+ chars long'
                      : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),

                TextFormField(
                controller: _textEditingController,
                decoration: textInputDecoration,
                readOnly: true,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result =
                      await _auth.registerWithEmailAndPassword(
                          email,
                          password,
                          name,
                          phone,
                          country,
                          sell,
                      favorites);
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Please supply a valid email';
                        });
                      }
                    }
                  }),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
              ],
            ),
          ),)
          ,
          );
        });
  }
}
