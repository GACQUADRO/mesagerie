import 'package:flutter/material.dart';
import 'package:mesagerie/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mesagerie/fonctions/firebaseFonc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Messagerie';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
          child: bodyPage(),
          padding: EdgeInsets.all(20),
        ));
  }

  @override
  Widget bodyPage() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          TextFormField(
            //obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
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
              if (_formKey.currentState!.validate()) {
                // Process data.
              }
            },
            child: const Text('Submit'),
          ),
         InkWell(
            child: Text(
              "Inscription",
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              print("J'ai tappé une fois");
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return register();
                  }));
            },
          ),
        ],
      ),
    );
  }
}
