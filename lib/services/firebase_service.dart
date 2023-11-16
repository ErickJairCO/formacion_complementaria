import 'package:cloud_firestore/cloud_firestore.dart';

//Creacion de la conexion hacia nuestra base de datos
FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsers() async{
  List users  = [];
  CollectionReference coleccionUsers = db.collection('users');

  return users;
}