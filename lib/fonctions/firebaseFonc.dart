
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:projetclassb2b/Model/Utilisateur.dart';



class firebaseFonc {
//Attributs


final auth = FirebaseAuth.instance;
final fire_user = FirebaseFirestore.instance.collection("Utilisateurs");
final fireStorage = FirebaseStorage.instance;



//Constructeur



//méthode

//Pour l'inscription
Future Inscription(String mail,String password,String pseudo) async {
  UserCredential resultat = await auth.createUserWithEmailAndPassword(email: mail, password: password);
  User? user = resultat.user;
  String uid = user!.uid;
  Map<String,dynamic>map = {
    "PSEUDO" : pseudo,
    "MAIL": mail
  };
  addUser(uid, map);

}



//Pour la connexion

Future Connexion(String mail, String password) async {
  UserCredential resultat = await auth.signInWithEmailAndPassword(email: mail, password: password);

}


//Ajouter des utilisateurs
addUser(String uid,Map<String,dynamic>map){
  fire_user.doc(uid).set(map);

}



}