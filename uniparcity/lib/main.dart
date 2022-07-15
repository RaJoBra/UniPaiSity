import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Willkommen bei UniPairCity'),
            actions: const <Widget>[
              IconButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: builder)
                )
              }, icon: Icon(Icons.person))
            ]),
        body: const Center(
          child: Text('Hello World'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
          ],
        ),
      ),
    );
  }
}
