import 'package:flutter/material.dart';
import 'package:mesagerie/fonctions/firebaseFonc.dart';

class register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return registerState();
  }
}

class registerState extends State<register> {
  String mail = "";
  late String password;
  late String pseudo;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Inscription"),
          centerTitle: true,
        ),
        body: Container(
          child: bodyPage(),
          padding: EdgeInsets.all(20),
        ));
  }

  Widget bodyPage() {
    return Column(
      children: [
        // champ pour le pseudo
        TextFormField(
          onChanged: (value){
            setState(() {
              pseudo = value;
            });

          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Pseudo',
          ),
          // on check si le champ est bien remplie
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a pseudo';
            }
            return null;
          },
        ),
        SizedBox(height: 10),
        // champ pour le mail
        TextFormField(
          onChanged: (value){
            setState(() {
              mail = value;
            });

          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Mail',
          ),
          // on check si le champ est bien remplie
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a mail';
            }
            return null;
          },
        ),
        SizedBox(height: 10),
        // champ pour le mp
        TextFormField(
          onChanged: (value){
            setState(() {
              password = value;
            });

          },
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
          // on check si le champ est bien remplie
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            return null;
          },
        ),
        SizedBox(height: 10),
        // le button d'inscription
        ElevatedButton(
          onPressed: () {
           firebaseFonc().Inscription(mail, password, pseudo);
           print(mail);
           showDialog(
             context: context,
             builder: (BuildContext context) => _buildPopupDialog(context),
           );
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }


  // le pop up
  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Inscription r??ussie !'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Vous pouvez maintenant vous connectez ?? l'application."),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Fermer'),
        ),
      ],
    );
  }
}
