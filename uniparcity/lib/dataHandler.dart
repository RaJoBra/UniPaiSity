import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:uniparcity/Model/PlanningItemModel.dart';
import 'Model/UniversitatsModel.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'Model/StudentModel.dart';
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

    final response = await http.put(Uri.parse('$baseUrl$endpoint/$id'),
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

  void DeleteAccount() async {
    const endpoint = 'Student';
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint/$STUDENTID'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists()) directory = await getExternalStorageDirectory();
      }
    } catch (err, stack) {
      print("Cannot get download folder path");
    }
    return directory?.path;
  }

  Future<String> downloadFile( ) async {
    HttpClient httpClient = HttpClient();
    File file;
    var dir = await getDownloadPath();
    String fileName = 'UniPairCityData';
    String endpoint = 'Student';
    String filePath = '';
    String myUrl = '$baseUrl$endpoint/$STUDENTID';

    try {
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      if(response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName';
        file = File(filePath);
        await file.writeAsBytes(bytes);
      }
      else
        filePath = 'Error code: '+response.statusCode.toString();
    }
    catch(ex){
      filePath = 'Can not fetch url';
    }

    return filePath;
  }

    Future<String> createStudent(Student student) async {
      const endpoint = 'Student';

      final response = await http.post(Uri.parse('$baseUrl$endpoint'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(student.toJson()));

      print(response.statusCode);
      if(response.statusCode == 201) {
        var responseBody = await jsonDecode(response.body);
        Student responseStudent = Student.fromJson(responseBody);
        await Future.delayed(Duration(seconds: 2));
        STUDENTID = await responseBody['id'];

        return await responseBody['id'].toString();
      } else {
        throw Exception('Could not get Student');
      }
    }

    Future<Student> getStudentWithId() async {
      const endpoint = 'Student';
      sleep(const Duration(seconds: 2));

      print(STUDENTID);

      final response =
          await http.get(Uri.parse('$baseUrl$endpoint/$STUDENTID'));

      if (response.statusCode == 200) {
        var jsonResponse = await json.decode(response.body);

        Student student = Student.fromJson(jsonResponse);

        return student;
      } else {
        throw Exception('Failed to load ');
      }
    }
  }

