import 'package:flutter/material.dart';
import 'package:uniparcity/CustomBottomNavBar.dart';

class MyData extends StatelessWidget {
  const MyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Ihre Daten'),
      ),
      body: Center(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
