import 'package:flutter/material.dart';
import 'package:mesagerie/Model/Messages.dart';
import 'package:mesagerie/Model/Utilisateur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mesagerie/fonctions/firebaseFonc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class discussion extends StatefulWidget {
  Utilisateur user;
  discussion({required Utilisateur this.user});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return discussionState();
  }
}

//${firebaseFonc().cur_user?.email} => l'utilisateur qui est connecté
//${widget.user.pseudo} => l'utilisateur avec qui on veut parler


class discussionState extends State<discussion> {
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.user.pseudo}"),
        ),
        body: Center(
          child: bodyPage(),
        ));
  }


  final myController = TextEditingController();

  Widget bodyPage() {
    return StreamBuilder<QuerySnapshot>(
        stream: firebaseFonc().fire_msg.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            List documents = snapshot.data!.docs;
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  Messages msg = Messages(documents[index]);
                  print(firebaseFonc().cur_user?.email);

                  if(msg.sendBy == firebaseFonc().cur_user?.email && msg.sendFor == widget.user.mail ){

                    return Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        onTap: () {
                          /* Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return detail(user: user,);
                            }
                        ));*/
                        },
                        title: Text("${msg.content}"),

                      ),
                    );

                  } else { //Le code veut un else donc j'ai mis ca, ca permet d'avoir rien d'afficher mais ca met un petit espace,
                          // si tu trouves mieux c'est cool
                    return Text("");



                  }

                });
          }
        });
  }
}
