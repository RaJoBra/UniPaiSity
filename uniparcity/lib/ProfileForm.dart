import 'package:flutter/material.dart';
import 'package:uniparcity/config.dart';
import 'package:uniparcity/home.dart';


class Profilform extends StatelessWidget {
  final nameController = TextEditingController();
  final prenameController = TextEditingController();
  final majorController = TextEditingController();
  final numberController = TextEditingController();
  final mailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  key: Key('name'),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white.withOpacity(0.74),
                    filled: true,
                  ),
                  controller: nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  key: Key('prename'),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Vorname',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white.withOpacity(0.74),
                    filled: true,
                  ),
                  controller: nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  key: Key('major'),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Studiengang',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white.withOpacity(0.74),
                    filled: true,
                  ),
                  controller: nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  key: Key('number'),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Telefonnummer',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white.withOpacity(0.74),
                    filled: true,
                  ),
                  controller: nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  key: Key('mail'),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white.withOpacity(0.74),
                    filled: true,
                  ),
                  controller: nameController,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    PROFILEEXISTS = true;
                  }, // In der Funktion noch validieren wenn du willst und dann halt abschicken.
                  child: const Text(
                    'Profil anlegen',
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
          ),
        ),
      ),
    );
  }
}
