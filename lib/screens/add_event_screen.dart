import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../database/database_helper.dart';
import '../models/evento.dart';

class AddEventScreen extends StatefulWidget {

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {

  final tituloController = TextEditingController();
  final descripcionController = TextEditingController();

  File? imagen;

  Future tomarFoto() async {

    final picker = ImagePicker();

    final foto = await picker.pickImage(source: ImageSource.camera);

    if(foto != null){
      setState(() {
        imagen = File(foto.path);
      });
    }
  }

  guardarEvento() async {

    final evento = Evento(
        fecha: DateTime.now().toString(),
        titulo: tituloController.text,
        descripcion: descripcionController.text,
        foto: imagen?.path ?? ""
    );

    await DatabaseHelper.instance.insertarEvento(evento);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Registrar Evento"),
      ),

      body: Padding(

        padding: EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: tituloController,
              decoration: InputDecoration(labelText: "Título"),
            ),

            TextField(
              controller: descripcionController,
              decoration: InputDecoration(labelText: "Descripción"),
            ),

            SizedBox(height:20),

            imagen != null
                ? Image.file(imagen!, height:150)
                : Text("No hay foto"),

            ElevatedButton(
              onPressed: tomarFoto,
              child: Text("Tomar Foto"),
            ),

            SizedBox(height:20),

            ElevatedButton(
              onPressed: guardarEvento,
              child: Text("Guardar Evento"),
            )

          ],
        ),
      ),
    );
  }
}