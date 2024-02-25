import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_with_result.dart';

abstract class UserStorage {
  static late SharedPreferences _sp;

  static Future<void> init() async {
    _sp = await SharedPreferences.getInstance();
  }

  static const _URL = "url";

  static void saveUrl(String? url) {
    unawaited(
      url == null ? _sp.remove(_URL) : _sp.setString(_URL, url),
    );
  }

  static String? getSavedUrl() => _sp.getString(_URL);

  static const _RESULTS = "results";

  static void saveResults(List<TaskWithResult> results) {
    final prevResults = _sp.getStringList(_RESULTS);

    final data = results.map((e) => jsonEncode(e.toJson())).toList();
    unawaited(
      _sp.setStringList(
        _RESULTS,
        prevResults == null ? data : prevResults
          ..addAll(data),
      ),
    );
  }

  static List<TaskWithResult> getSavedResults() {
    final r = _sp.getStringList(_RESULTS);
    return r == null
        ? []
        : r
            .map(
              (e) => TaskWithResult.fromJson(
                  jsonDecode(e) as Map<String, dynamic>),
            )
            .toList();
  }
}
