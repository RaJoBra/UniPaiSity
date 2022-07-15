import 'package:flutter/material.dart';
import 'package:uniparcity/dataHandler.dart';

class UniversityPage extends StatefulWidget {
  const UniversityPage({Key? key}) : super(key: key);

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {

  var data = new dataHandler();

  var university =  dataHandler._fetchData();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
