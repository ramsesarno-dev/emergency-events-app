import 'dart:io';
import 'package:flutter/material.dart';
import '../models/evento.dart';

class DetailScreen extends StatelessWidget{

  final Evento evento;

  DetailScreen({required this.evento});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Detalle del Evento"),

    ),

      body: Padding(

        padding: EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text("Fecha: ${evento.fecha}"),
            SizedBox(height:10),

            Text("Título: ${evento.titulo}"),
            SizedBox(height:10),

            Text("Descripción: ${evento.descripcion}"),
            SizedBox(height:20),

            evento.foto != ""
                ? Image.file(File(evento.foto))
                : Text("No hay foto")

          ],
        ),
      ),
    );
  }
}