import 'package:flutter/material.dart';

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
  late String nom;
  late String prenom;

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
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Pseudo',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a pseudo';
            }
            return null;
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Mail',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a mail';
            }
            return null;
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            return null;
          },
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Validate will return true if the form is valid, or false if
            // the form is invalid.
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}