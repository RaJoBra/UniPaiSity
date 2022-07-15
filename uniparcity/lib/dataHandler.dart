import 'package:http/http.dart' as http;
import 'UniversitatsModel.dart';
import 'dart:io';
import 'dart:convert';


class dataHandler {
  static const apiUrl = 'https://62cebc7b826a88972d01f8d7.mockapi.io/';
  HttpClient client = HttpClient();

  Future<List<UniversitatsModel>> _fetchUniversity() async {
    const endpoint = 'university';

    final response = await http.get(Uri.parse(apiUrl+endpoint));

    if(response.statusCode == 200) {
      final body = json.decode()
        UniversitatsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load ');
    }
  }
}