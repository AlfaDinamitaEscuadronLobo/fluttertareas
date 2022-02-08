class AppInfoScreen extends StatelessWidget {
  static String id = 'AppInfoScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.arrowLeft,
                        size: 30.0,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ListTile(
                      title: Text(
                          'Desarrollado por:                                            '
                              'Allende Flores Maria del Carmen                            '
                              'Ortiz Pachacutec Felix Raul                                       '
                              'Muñoz Apaza Geidar Omar Renzo                   '
                              '.                                                     '
                              'Objetivo de la aplicacion es ser gestor de tareas con recordatorios '),
                    ),
                    Divider(
                      thickness: 2.0,
                    ),
                    ListTile(
                      title: Text('VERSION 0.1'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}