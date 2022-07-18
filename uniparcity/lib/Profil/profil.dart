import 'package:flutter/material.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';
import '../config.dart';
import '../dataHandler.dart';
import 'ProfileForm.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  bool profileData;

  DataHandler handler = new DataHandler();

  _ProfilState({this.profileData = false});

  @override
  Widget build(BuildContext context) {
    if (PROFILEEXISTS == false) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Noch kein Profil vorhanden"),
        ), //hier AppBar von euch einsetzen
        body: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profilform())),
            child: const Text(
              'Profil anlegen ',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
              title: Text('Dein Profil'),
              backgroundColor: Colors.redAccent,
              // Hier einfach noch das hinzufügen was ihr in eurer AppBar wollt
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => setState(() {
                  profileData = false;
                }),
              )),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: const Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.blue,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Vorname',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Nachname',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
      bottomNavigationBar: CustomBottomNavBar(),);
    }
  }
}
