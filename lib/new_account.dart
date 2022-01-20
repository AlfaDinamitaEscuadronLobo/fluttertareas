// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  String email = '';
  String password = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFe0d8c3),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                child: Text(
                  "CREAR CUENTA",
                  style: TextStyle(fontSize: 30, fontFamily: "monofonto"),
                ),
              ),
              Padding(padding: EdgeInsets.all(1)),
              SizedBox(
                height: 25,
                width: 300,
                child: Text(
                  "Email",
                  //textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 22, fontFamily: "monofonto"),
                ),
              ),
              Padding(padding: EdgeInsets.all(1)),
              SizedBox(
                width: 300,
                child: TextField(
                  onChanged: (value1) {
                    email = value1;
                  },
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF2e4756),
                      fontFamily: "SourceCodePro"),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.red,
                  decoration: const InputDecoration(hintText: 'Your Email'),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                height: 25,
                width: 300,
                child: Text(
                  "Contraseña",
                  //textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 22, fontFamily: "monofonto"),
                ),
              ),
              Padding(padding: EdgeInsets.all(1)),
              SizedBox(
                width: 300,
                child: TextField(
                    onChanged: (value2) {
                      password = value2;
                    },
                    obscureText: true,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF2e4756),
                        fontFamily: "SourceCodePro"),
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        hintText: 'Digite Su Contraseña')),
              ),
              Padding(padding: EdgeInsets.all(10)),
              new MaterialButton(
                minWidth: 170,
                height: 50,
                child: Text(
                  "CREATE",
                  style: TextStyle(
                      fontFamily: "monofonto",
                      fontSize: 20,
                      color: Colors.white),
                ),
                color: Color(0xFF405858),
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    // ignore: unnecessary_null_comparison
                    if (newUser != null) {
                      Navigator.pushNamed(context, 'Home');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
