

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
