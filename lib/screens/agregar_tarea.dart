import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';

import '../main.dart';

class AddTaskScreen extends StatefulWidget {
  static String id = 'AddTaskScrseen';

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskController = TextEditingController();

  String currTask = '';
  bool remindMe = false;
  DateTime reminderDate;
  TimeOfDay reminderTime;
  int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF405858),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Agregar Tarea',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF405858),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                controller: taskController,
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (newVal) {
                  currTask = newVal;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(2.0),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SwitchListTile(
                value: remindMe,
                title: Text('Recordatorio'),
                onChanged: (newValue) async {
                  if (newValue) {
                    reminderDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 2),
                    );

                    if (reminderDate == null) {
                      return;
                    }

                    reminderTime =
                        await showTimePicker(context: context, initialTime: TimeOfDay.now());

                    if (reminderDate != null && reminderTime != null) {
                      remindMe = newValue;
                    }
                  } else {
                    reminderDate = null;
                    reminderTime = null;
                    remindMe = newValue;
                  }

                  print(reminderTime);
                  print(reminderDate);

                  setState(() {});
                },
                subtitle: Text('recordar tarea'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                  child: remindMe
                      ? Text('Recordario en: ' +
                          DateTime(reminderDate.year, reminderDate.month, reminderDate.day,
                                  reminderTime.hour, reminderTime.minute)
                              .toString())
                      : null),
              SizedBox(
                height: remindMe ? 10.0 : 0.0,
              ),
              FlatButton(
                color: Color(0xFF405858),
                onPressed: () async {
                  if (remindMe) {
                    var scheduledNotificationDateTime = reminderDate
                        .add(Duration(hours: reminderTime.hour, minutes: reminderTime.minute))
                        .subtract(Duration(seconds: 5));
                    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
                      currTask,
                      'Notificacion',
                      'Hacer la tarea',
                      priority: Priority.Max,
                      importance: Importance.Max,
                      playSound: true,
                    );
                    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
                    NotificationDetails platformChannelSpecifics = NotificationDetails(
                        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
                    id = Provider.of<TaskData>(context, listen: false).tasks.length;
                    print(id);
                    await flutterLocalNotificationsPlugin.schedule(
                        id,
                        'Recordatorio de tareas',
                        'Alarma tarea: $currTask',
                        scheduledNotificationDateTime,
                        platformChannelSpecifics);
                  }

                  Provider.of<TaskData>(
                    context,
                    listen: false,
                  ).addTask(Task(
                    title: currTask,
                    isChecked: false,
                    reminderDate: reminderDate == null
                        ? null
                        : reminderDate.add(Duration(
                            hours: reminderTime.hour,
                            minutes: reminderTime.minute,
                          )),
                    reminderId: reminderDate != null ? id : null,
                  ));
                  Navigator.pop(context);
                },
                child: Text(
                  'AGREGAR',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
