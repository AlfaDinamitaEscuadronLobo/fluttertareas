class TaskEditScreen extends StatefulWidget {
  TaskEditScreen({this.task});

  final Task task;

  @override
  _TaskEditScreenState createState() => _TaskEditScreenState();
}
class _TaskEditScreenState extends State<TaskEditScreen> {
  final titleController = TextEditingController();

  bool dropDownVal = false;
  DateTime reminderDate;
  String reminderDateString;

  String newTaskTitle;
  DateTime newTaskReminderDate;
  bool newTaskIsChecked;

  @override
  void initState() {
    super.initState();
    titleController.value = TextEditingValue(
      text: widget.task.title,
    );
    newTaskTitle = widget.task.title;
    dropDownVal = widget.task.isChecked;
    newTaskIsChecked = widget.task.isChecked;
    reminderDate = widget.task.reminderDate;
    newTaskReminderDate = reminderDate;
    reminderDateString = reminderDate.toString();
  }

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
                      'Editar Tarea',
                      style: TextStyle(

                        fontSize: 50.0,
                        color: Colors.white,

                      ),
                    ),
                  ),
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
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 30.0,
                        left: 30.0,
                        right: 30.0,
                        bottom: 30.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Title: ',
                                    style: kTaskInfoTextStyle,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      onChanged: (newValue) {
                                        newTaskTitle = newValue;
                                      },
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      controller: titleController,
                                      style: kTaskInfoTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.0),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '¿Tarea terminada? : ',
                                    style: kTaskInfoTextStyle,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  DropdownButton<bool>(
                                    value: dropDownVal,
                                    style: kTaskInfoTextStyle,
                                    items: [true, false]
                                        .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e.toString())))
                                        .toList(),
                                    onChanged: (newVal) {
                                      setState(() {
                                        dropDownVal = newVal;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Recordatorio: ',
                                    style: kTaskInfoTextStyle,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                      color: Color(0xFF405858),
                                      onPressed: () async {
                                        newTaskReminderDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    reminderDate != null
                                                        ? reminderDate
                                                        : DateTime.now(),
                                                firstDate: reminderDate != null
                                                    ? reminderDate
                                                    : DateTime.now(),
                                                lastDate: DateTime(
                                                    DateTime.now().year + 2));

                                        if (newTaskReminderDate == null) {
                                          return;
                                        }

