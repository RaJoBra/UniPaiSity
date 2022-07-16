import 'package:http/http.dart' as http;
import 'package:uniparcity/PlanningItemModel.dart';
import 'UniversitatsModel.dart';
import 'dart:convert';


class DataHandler {
  static const apiUrl = 'https://62cebc7b826a88972d01f8d7.mockapi.io/';

  Future<List<PlanningItem>> fetchPlaningItems() async {
    const endpoint = 'PlanningListItem';

    final response = await http.get(Uri.parse(apiUrl+endpoint));

    if(response.statusCode == 200) {
      List jsonResponse = await json.decode(response.body);
      List<PlanningItem> planning = [];


      for (var u in jsonResponse) {
        print("hallo");
        // PlanningItem item = PlanningItem(id: u["id"], studentId: u["studentId"], description: u["description"], dueDate: u["dueDate"], open: u["open"]);
        var item = PlanningItem.fromJson(u);
        planning.add(item);
      }

      return planning;
    } else {
      throw Exception('Failed to load ');
    }
  }
}