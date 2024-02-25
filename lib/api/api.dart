import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/task.dart';
import '../models/task_with_result.dart';
import 'models/api_response.dart';

abstract class API{

  static bool isValidUrl(String url) => Uri.parse(url).isAbsolute;

  static Future<List<Task>> fetchTasks(String url) async {
    final uri = Uri.parse(url);
    try{
      final response = await http.get(uri);
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;

      if(response.statusCode != 200){
        throw Exception(responseBody['message']);
      }
      final result = ApiResponse.fromJson(responseBody);
      
      return result.data.map(Task.fromJson).toList();
    } catch (e, st){
      if(kDebugMode){
        print(e);
        print(st);
      }
      rethrow;
    }
  }

  static Future<bool> sendTasksResult(String url, List<TaskWithResult> results) async {
    final uri = Uri.parse(url);
    final headers =  {'Content-Type': 'application/json'};
    final body = jsonEncode(results.map((r) => r.toApiJson()).toList());

    try{
      final response = await http.post(uri, headers: headers, body: body);
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;

      if(response.statusCode != 200){
        throw Exception(responseBody['message']);
      }
      return true;
    } catch (e, st){
      if(kDebugMode){
        print(e);
        print(st);
      }
      rethrow;
    }
  }
}
