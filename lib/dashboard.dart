import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mesagerie/Model/Utilisateur.dart';
//import 'package:mesagerie/detail.dart';
import 'package:mesagerie/fonctions/firebaseFonc.dart';
import 'package:mesagerie/discussion.dart';
//import 'package:projetclassb2b/myWidgets/myDrawer.dart';

class dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return dashboardState();
  }
}

class dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //drawer: myDrawer(),
      appBar: AppBar(
        title: Text("TikTak"),
      ),
      body: bodyPage(),
    );
  }

  Widget bodyPage() {
    return StreamBuilder<QuerySnapshot>(
        stream: firebaseFonc().fire_user.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            List documents = snapshot.data!.docs;
            // on recupere a partir de la bdd sous form d'un liste tous les users
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  Utilisateur user = Utilisateur(documents[index]);
                  // la form d'un user
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
                      leading: (user.avatar == null)
                          ? Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                /*image: DecorationImage(
                                image: NetworkImage("https://voitures.com/wp-content/uploads/2017/06/Kodiaq_079.jpg.jpg"),
                                fit: BoxFit.fill
                            )*/
                              ),
                            )
                          : Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(user.avatar!),
                                      fit: BoxFit.fill)),
                            ),
                      title: Text("${user.pseudo}"),
                      trailing: IconButton(
                        icon: Icon(Icons.chat_bubble),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return discussion(
                              user: user,
                            );
                          }));
                          print("modification");
                        },
                      ),
                    ),
                  );
                });
          }
        });
  }
}
