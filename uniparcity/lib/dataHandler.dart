import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:uniparcity/Model/PlanningItemModel.dart';
import 'Model/UniversitatsModel.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'StudentModel.dart';
import 'Model/StudentModel.dart';
import 'config.dart';

class DataHandler {
  static const baseUrl = 'https://62cebc7b826a88972d01f8d7.mockapi.io/';

  Future<List<PlanningItem>> fetchPlaningItems() async {
    const endpoint = 'PlanningListItem';

    final response = await http.get(Uri.parse(baseUrl + endpoint));

    if (response.statusCode == 200) {
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

  Future<List<UniversitatsModel>> fetchUniversitys() async {
    const endpoint = 'PlanningListItem';

    final response = await http.get(Uri.parse(baseUrl + endpoint));

    if (response.statusCode == 200) {
      List jsonResponse = await json.decode(response.body);
      List<UniversitatsModel> uniList = [];


      for (var u in jsonResponse) {
        // PlanningItem item = PlanningItem(id: u["id"], studentId: u["studentId"], description: u["description"], dueDate: u["dueDate"], open: u["open"]);
        var item = UniversitatsModel.fromJson(u);
        uniList.add(item);
      }
      return uniList;
    } else {
      throw Exception('Failed to load ');
    }
  }

  void updatePlanningItem(PlanningItem item) async {
    const endpoint = 'PlanningListItem';
    final id = item.id;

    final response = await http.put(Uri.parse('$baseUrl$endpoint/$item.id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(item.toJson()));
  }

  void createPlanningItem(PlanningItem item) async {
    const endpoint = 'PlanningListItem';
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(item),
    );
  }

  void createStudent(Student student) async {
  Future<String> createStudent(Student student) async {
    const endpoint = 'Student';

    final response = await http.post(Uri.parse('$baseUrl$endpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(student.toJson()));

    var responseBody = await jsonDecode(response.body);
    Student responseStudent = Student.fromJson(responseBody);
    STUDENTID = await responseBody['id'];

    return await responseBody['id'];
  }

  Future<Student> getStudentWithId () async {
    const endpoint = 'Student';
    sleep(const Duration(seconds:2));

    print(STUDENTID);

    final response = await http.get(Uri.parse('$baseUrl$endpoint/$STUDENTID'));

    if (response.statusCode == 200) {
      var jsonResponse = await json.decode(response.body);

      Student student = Student.fromJson(jsonResponse);

      return student;
    } else {
      throw Exception('Failed to load ');
    }
  }
}
