class InstructionsScreen extends StatelessWidget {
  static String id = 'InstructionsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 30.0,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InstructionTile(
                    title:
                        'INFORMACION: Manten presionado una tarea para ver su informacion.',
                  ),
                  InstructionTile(
                    title:
                    'EDITAR: Para editar una tarea manten presionado una tarea.',
                  ),
                  InstructionTile(
                    title: 'AGREGAR: Haga clic en el boton + para agregar una nueva tarea',
                  ),
                  InstructionTile(
                    title:
                        'TAREA COMPLETADA: Haga clic en el checbox para marcarla',
                  ),
                  InstructionTile(
                    title: 'ELIMINAR TAREA: Deslice una tarea en cualquier direccion para eliminarla.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}