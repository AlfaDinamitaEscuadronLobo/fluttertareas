import 'package:firebase_simple_auth_test/addtododual.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';

class ventana extends StatefulWidget {
  const ventana({Key? key}) : super(key: key);
  @override
  _ventanaState createState() => _ventanaState();
}

class _ventanaState extends State<ventana> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      Container(),
      Container(),
    ];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de tareas",
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "monofonto",
          ),
        ),
        backgroundColor: Color(0xFF405858),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF405858),
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: "todos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done, size: 28), label: "completado"),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Color(0xFF405858),
        onPressed: () => showDialog(
          context: context,
          child: AddTodoDialogWitdget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
