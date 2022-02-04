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