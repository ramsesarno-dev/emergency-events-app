import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/evento.dart';
import 'add_event_screen.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

List<Evento> eventos = [];

@override
void initState(){
  super.initState();
  cargarEventos();
}

void cargarEventos() async{

  final data = await DatabaseHelper.instance.obtenerEventos();

  setState(() {
    eventos = data;
  });
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Eventos 911"),
      ),

      body: ListView.builder(

        itemCount: eventos.length,

        itemBuilder: (context,index){

          final evento = eventos[index];

          return ListTile(

            title: Text(evento.titulo),
            subtitle: Text(evento.fecha),

            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailScreen(evento: evento)
                  )
              );
            },

          );
        },
      ),

      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add),

        onPressed: () async {

          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AddEventScreen()
              )
          );

          cargarEventos();
        },
      ),
    );
  }
}