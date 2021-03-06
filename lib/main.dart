import 'package:flutter/material.dart';
import 'package:mesagerie/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mesagerie/fonctions/firebaseFonc.dart';
import 'package:mesagerie/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Tiktak';

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

  late String mail;
  late String password;

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
          // champ pour le mail
          TextFormField(
            onChanged: (value){
              setState(() {
                mail = value;
              });
            },
            //obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
            // on check si le champ mail est bien remplie
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a mail';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          // champ pour le mot de passe
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
            // on check si le champ mp est bien remplie
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          // Button pour la connection
          ElevatedButton(
            onPressed: () {
            firebaseFonc().Connexion(mail, password).then((value){
              print("Connexion r??ussi");
              // renvoie vers la page dashboard
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return dashboard();
                  }
              ));

            }).catchError((onError){
              print("Connexion erron??");
            });
    },

            child: const Text('Submit'),
          ),
         // lien vers la page de creation de compte
         InkWell(
            child: Text(
              "Inscription",
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              print("J'ai tapp?? une fois");
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
