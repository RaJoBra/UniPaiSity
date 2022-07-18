import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uniparcity/config.dart';
import 'package:uniparcity/dataHandler.dart';
import 'package:uniparcity/home.dart';
import 'package:uniparcity/Profil/profil.dart';
import '../Model/StudentModel.dart';

class Profilform extends StatelessWidget {
  final nameController = TextEditingController();
  final firstNameController = TextEditingController();
  final studySpecilizationController = TextEditingController();
  final numberController = TextEditingController();
  final mailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final DataHandler handler = DataHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Erstellen sie ein Profil'),
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
                  controller: firstNameController,
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
                  controller: studySpecilizationController,
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
                  controller: numberController,
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
                  controller: mailController,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                  onPressed: () async {
                    PROFILEEXISTS = true;
                    var CreateStudent = Student(
                      Name: nameController.text,
                      Firstname: firstNameController.text,
                      StudySpecilization: studySpecilizationController.text,
                      PhoneNumber: numberController.text,
                      eMailAdress: mailController.text,
                    );

                    String id = await handler.createStudent(CreateStudent);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profil()),
                    );
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
