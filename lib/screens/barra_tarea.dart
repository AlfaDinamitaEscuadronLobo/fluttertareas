import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/screens/agregar_tarea.dart';
import 'package:todoey/screens/info_version.dart';
import 'package:todoey/screens/instrucciones.dart';
import 'package:todoey/screens/modo_oscuro.dart';
import 'package:todoey/widgets/tasks_list.dart' hide localStorage;
import 'package:todoey/models/task_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TasksScreen extends StatelessWidget {
  static String id = 'tasksScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: ListView(

            padding: EdgeInsets.only(top: 40.0),
            children: <Widget>[
              ListTile(
                iconColor: Color(0xFF405858),
                leading: Icon(Icons.info),
                title: Text('Info',),
                onTap: () {
                  Navigator.pushNamed(context, AppInfoScreen.id);
                },
              ),
              ListTile(
                  iconColor: Color(0xFF405858),
                  leading: Icon(FontAwesomeIcons.tasks),
                  title: Text('Instrucciones'),
                  onTap: () {
                    Navigator.pushNamed(context, InstructionsScreen.id);
                  }),
              ListTile(
                iconColor: Color(0xFF405858),
                leading: Icon(Icons.settings),
                title: Text('Configuracion'),
                onTap: () {
                  Navigator.pushNamed(context, SettingsScreen.id);
                },
              )
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF405858),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
        backgroundColor: Color(0xFF405858),
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: localStorage.ready,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 60.0,
                    left: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: Scaffold.of(context).openDrawer,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.list,
                            size: 30.0,
                            color: Color(0xFF405858),
                          ),
                          radius: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          'Lista de Tareas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        '${Provider.of<TaskData>(context).tasks.length} tarea',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: TasksList(),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
