import 'package:flutter/material.dart';
import 'package:uniparcity/PlanningItemModel.dart';
import 'package:uniparcity/dataHandler.dart';
import 'package:uniparcity/profil.dart';

import 'CustomBottomNavBar.dart';

class PlanningList extends StatefulWidget {
  @override
  PlanningListState createState() => new PlanningListState();
}

class PlanningListState extends State<PlanningList> {
  List<PlanningItem> planningItems = [PlanningItem(
  id: 1,
  studentId: 1,
  description: 'Koffer packen',
  dueDate: DateTime.now(),
  open: true)];

  void checkboxChanged(bool value, int id) {
    planningItems[id].open = !value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Packliste'),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profil()),
                  );
                },
                icon: const Icon(Icons.person),
              )
            ]),
      body: ListView.builder(
        itemCount: planningItems.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(planningItems[index].description.toString()),
            value: !planningItems[index].open,
            onChanged: (bool? value) {
              setState(() {
                planningItems[index].open = !value!;
                checkboxChanged(planningItems[index].open, planningItems[index].id);
              });
            }
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar()
    );
  }
}


