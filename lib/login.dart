import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_simple_auth_test/new_account.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{

  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email="";
 String password="";
final FirebaseAuth _auth = FirebaseAuth.instance;
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
       home: Scaffold(
         body: Container(
           child: Column(
             children: <Widget>[
               Padding(padding: EdgeInsets.all(30)),
               new Center(
                 child: Image(
                   width: 270,
                   image: new AssetImage("img/tareas.png"),
                 ),
               ),
               new SizedBox(
                 height: 10,
               ),
               new SizedBox(
                 child: Text(
                   "INICIAR SESION",
                   style: TextStyle(
                       fontSize: 30, fontFamily: "monofonto", color: Colors.black),
                 ),
               ),
               SizedBox(
                 height: 10,
               ),
               new Column(
                 children: <Widget>[
                   SizedBox(
                     width: 300,
                     height: 25,
                     child: Text(
                       "Email Address",
                       textAlign: TextAlign.justify,
                       style: TextStyle(fontSize: 22, fontFamily: "monofonto"),
                     ),
                   )
                 ],
               ),
               Padding(padding: EdgeInsets.all(1)),
               SizedBox(
                 width: 300,
                 child: TextField(
                   onChanged: (value1){email = value1;},
                   keyboardType: TextInputType.emailAddress,
                   style: TextStyle(fontFamily: "SourceCodePro", fontSize: 15),
                   decoration: InputDecoration(
                     hintText: "usuario de email",
                     prefixIcon: Icon(
                       Icons.mail,
                       color: Color(0xFF2e4756),
                     ),
                   ),
                 ),
               ),
               Padding(padding: EdgeInsets.all(10)),
               SizedBox(
                 width: 300,
                 child: Text(
                   "Passworrd",
                   textAlign: TextAlign.left,
                   style: TextStyle(fontSize: 22, fontFamily: "monofonto"),
                 ),
               ),
               Padding(padding: EdgeInsets.all(1)),
               SizedBox(
                 width: 300,
                 child: TextField(
                   onChanged: (value2){
                     password = value2;
                   },
                   obscureText: true,
                   keyboardType: TextInputType.emailAddress,
                   style: TextStyle(fontFamily: "SourceCodePro", fontSize: 15),
                   decoration: InputDecoration(
                     hintText: "password",
                     prefixIcon: Icon(
                       Icons.lock,
                       color: Color(0xFF2e4756),
                     ),
                   ),
                 ),
               ),
               Padding(padding: EdgeInsets.all(10)),
               new MaterialButton(
                 minWidth: 170,
                 height: 50,
                 child: Text(
                   "CREATE",style: TextStyle(fontFamily: "monofonto",fontSize: 20, color: Colors.white),
                 ),
                 color: Color(0xFF405858),
                 onPressed: () async{
                 try {
                 final Usuario =
                 await _auth.signInWithEmailAndPassword(email: email, password: password);
                 // ignore: unnecessary_null_comparison
                 if (Usuario!= null)
                 {
                 Navigator.pushNamed(context, 'ventana');
                 }
                 } catch (e) {
                 print(e);
                 }
                 },
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20),
                  ),
               ),
               new MaterialButton(
                 height: 50,
                 minWidth: 170,
                 child: Text(
                   "REGISTRARSE",
                   style: TextStyle(
                       fontFamily: "monofonto",
                       fontSize: 20,
                       color: Colors.white),
                 ),
                 color: Color(0xFF405858),
                 onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>NewAccount()));
                 },
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20),
                 ),
               ),
             ],
           ),
         ),
         backgroundColor: Color(0xFFe0d8c3),
       )
   );
 }


}


