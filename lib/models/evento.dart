// ======================================================
// APP EVENTOS 911
// Nombre: Ramsés Ambiorix Arnó Rosario
// Matrícula: 2024-0078
// ======================================================


class Evento {

  int? id;
  String fecha;
  String titulo;
  String descripcion;
  String foto;

  Evento({
    this.id,
    required this.fecha,
    required this.titulo,
    required this.descripcion,
    required this.foto,
  });

  // convertir objeto a Map para SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fecha': fecha,
      'titulo': titulo,
      'descripcion': descripcion,
      'foto': foto
    };
  }

  // convertir Map a objeto
  factory Evento.fromMap(Map<String, dynamic> map){
    return Evento(
      id: map['id'],
      fecha: map['fecha'],
      titulo: map['titulo'],
      descripcion: map['descripcion'],
      foto: map['foto'],
    );
  }

}