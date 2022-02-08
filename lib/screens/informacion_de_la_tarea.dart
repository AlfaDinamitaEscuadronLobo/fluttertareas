class TaskInfoScreen extends StatelessWidget {
  TaskInfoScreen({this.task, this.index});

  final Task task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF405858),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                  size: 40.0,
                ),
                onPressed: () {

                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 20.0,
                  left: 30.0,
                  right: 30.0,
                  bottom: 30.0,
                ),
                child: new Center(
                child: Text(
                'Tarea',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                ),
              ),
              )

              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 30.0,
                      left: 30.0,
                      right: 30.0,
                      bottom: 30.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Titulo de la Tarea: ${task.title}',
                          style: kTaskInfoTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Tarea Realizada: ${task.isChecked}',
                          style: kTaskInfoTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Recordatorio de tarea: ${task.reminderDate != null ? task.reminderDate.toString() : "Not set"}',
                          style: kTaskInfoTextStyle,
                        ),
                        Expanded(

                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,

                            children: <Widget>[
                              OptionButton(


                                title:
                                    'Marcar ${task.isChecked ? 'Inc' : 'T'}area completada',
                                onPressed: () {
                                  Provider.of<TaskData>(
                                    context,

                                    listen: false,
                                  ).toggleCheck(task);
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(height: 20.0),
                              OptionButton(
                                  title: 'Editar Tarea',
                                  onPressed: () async {
                                    await Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return TaskEditScreen(task: task);
                                    }));
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
