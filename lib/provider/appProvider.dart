import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:small_project_with_provider/model/app.dart';
import 'package:small_project_with_provider/widget/AppData.dart';

class AppProvider extends ChangeNotifier {
  List<AppModel> _list = [];

  List<AppModel> get list => _list;

  Future fetchData() async {
    var response = await http.get(
        Uri.parse(AppData.url+'action=app'),);

    List data = jsonDecode(response.body);

    List<AppModel> loaded = [];

    for (int i = 0; i < data.length; i++) {
      var result = AppModel.fromJson(data[i]);
      loaded.add(result);

    }
    _list=loaded;
    notifyListeners();
  }
}
