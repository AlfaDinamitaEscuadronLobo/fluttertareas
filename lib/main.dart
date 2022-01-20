import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_simple_auth_test/new_account.dart';
import 'package:firebase_simple_auth_test/ventana.dart';
import 'package:flutter/material.dart';

import 'package:firebase_simple_auth_test/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  }
//--------------------------------------------------------------

//--------------------------------------------------------------
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: firtspage(),
      routes: {
        "login": (context) => Login(),
        "NewAccount": (context) => NewAccount(),
        "ventana": (context) => ventana(),

      },
    );
  }
}


class firtspage extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return   Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(45)),
                new Center(
                  child: Image(
                    image: new AssetImage("img/iconota.png"),
                    width: 270,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "TO DO",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontFamily: "monofonto"),
                ),
                Padding(padding: EdgeInsets.all(2)),
                SizedBox(
                  width: 300,
                  height: 67,
                  child: Text(
                    "Una aplicacion sencilla para la gestion de tareas, Sientase  libre de expresar",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: "SourceCodePro",
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Text(
                  "sus ideas",
                  style: TextStyle(
                      fontFamily: "SourceCodePro",
                      fontSize: 18,
                      color: Colors.black),
                ),
                Padding(padding: EdgeInsets.all(20)),
                new MaterialButton(
                  height: 50,
                  minWidth: 170,
                  child: Text(
                    "COMENZAR",
                    style: TextStyle(
                        fontFamily: "monofonto",
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  color: Color(0xFF405858),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Login()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFe0d8c3),

    );
  }

}

_newlogin(BuildContext context) {
  Navigator.of(context).pushNamed("login");
}

_newAccount(BuildContext context){
  Navigator.of(context).pushNamed("NewAccount");
}