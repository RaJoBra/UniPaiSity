import 'package:flutter/material.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';
import 'ProfileForm.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  bool profileData;

  _ProfilState({this.profileData = false});

  @override
  Widget build(BuildContext context) {
    if (profileData == false) {
      return Scaffold(
        appBar: AppBar(), //hier AppBar von euch einsetzen
        body: profileData
            ? Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: const Icon(
                Icons.person,
                size: 80,
                color: Colors.blue,
              ),
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () => setState(() {
                  profileData = true;
                }),
                child: const Text(
                  'persönliche Daten',
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
          ],
        )
            : Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => Profilform())),
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
          // Hier einfach noch das hinzufügen was ihr in eurer AppBar wollt
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => setState(() {
                profileData = false;
              }),
            )),
        body: const Center(
          child: Text('Hier könnten ihre Daten stehen'),
        ),
      );
    }
  }
}
