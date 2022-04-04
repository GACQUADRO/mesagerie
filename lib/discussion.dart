import 'package:flutter/material.dart';
import 'package:mesagerie/Model/Utilisateur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mesagerie/fonctions/firebaseFonc.dart';

class discussion extends StatefulWidget {
  Utilisateur user;
  discussion({required Utilisateur this.user});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return discussionState();
  }
}

//${firebaseFonc().cur_user?.email}
//${widget.user.pseudo}

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
    return Form(
      child: Column(children: <Widget>[
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Send a message',
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                builder:
                (context) {
                  return AlertDialog(
                    content: Text(myController.text),
                  );
                };
                DateTime times = DateTime.now();
                firebaseFonc().sendMsg(myController.text,
                    firebaseFonc().cur_user?.email, widget.user.mail, times);
              },
              child: Icon(
                Icons.arrow_right_rounded,
                size: 45,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
