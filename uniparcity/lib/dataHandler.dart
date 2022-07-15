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
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      print( "Das ist aus unbekannten Gründen: " );
      print(jsonResponse.map((data) => new PlanningItem.fromJson(data)).toList().toString());
      return jsonResponse.map((data) => new PlanningItem.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load ');
    }
  }
}