import 'package:cloud_firestore/cloud_firestore.dart';

class Messages{
  //Attributs
  String id="";
  String content="";
  String sendBy="";
  String sendFor = "";





  //Contructeur
  Messages(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    content = map["CONTENT"];
    sendBy = map["SENDBY"];
    sendFor = map["SENDFOR"];


  }
  Messages.vide();

//Méthodes

}