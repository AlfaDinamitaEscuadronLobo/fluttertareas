import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/agregar_tarea.dart';
import 'package:todoey/screens/info_version.dart';
import 'package:todoey/screens/instrucciones.dart';
import 'package:todoey/screens/modo_oscuro.dart';
import 'package:todoey/screens/barra_tarea.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  var initializationSettingsIOS = IOSInitializationSettings();
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(ChangeNotifierProvider<TaskData>(
    create: (_) => TaskData(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<TaskData>(context).currTheme,
      title: 'Lista de Tareas',
      initialRoute: TasksScreen.id,
      routes: {
        TasksScreen.id: (context) => TasksScreen(),
        AddTaskScreen.id: (context) => AddTaskScreen(),
        AppInfoScreen.id: (context) => AppInfoScreen(),
        InstructionsScreen.id: (context) => InstructionsScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
      },
    );
  }
}
