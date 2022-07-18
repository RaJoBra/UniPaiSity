import 'package:flutter/material.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';
import 'package:uniparcity/Profil/MyData.dart';
import '../Model/StudentModel.dart';
import '../config.dart';
import '../dataHandler.dart';
import 'ProfileForm.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final TextEditingController _textFieldController = TextEditingController();
  bool profileData;

  DataHandler handler = DataHandler();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Warnhinweis'),
            content: const Text('Sollen alle ihre Daten unwiderruflich gelöscht werden'),
            actions: <Widget>[
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  handler.DeleteAccount();
                  setState(() {
                    Navigator.pop(context);
                    PROFILEEXISTS = false;
                  });
                },
              ),
            ],
          );
        });
  }

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
            Container(
              alignment: Alignment.topCenter,
              child: const Icon(
                Icons.person,
                size: 80,
                color: Colors.blue,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FutureBuilder<Student>(
                  future: handler.getStudentWithId(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: const Center(
                          child: Text('Loading...'),
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                snapshot.data!.Firstname.toString(),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: const TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(20),
                              ),
                              Text(
                                snapshot.data!.Name.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(40),
                          ),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                              ),
                              onPressed: () {
                                print('Something');
                                var filePath = handler.downloadFile();
                                print('$filePath');

                              },
                              child: const Text(
                                'Persönliche Daten importieren ',
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () => _displayTextInputDialog(context),
                            child: const Text(
                              'Persönliche Daten Löschen ',
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(),
      );
    }
  }
}
