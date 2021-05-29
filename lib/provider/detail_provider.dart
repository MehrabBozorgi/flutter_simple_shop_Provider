import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:small_project_with_provider/model/app.dart';
import 'package:http/http.dart' as http;
import 'package:small_project_with_provider/widget/AppData.dart';

class DetailProvider extends ChangeNotifier {
  List<AppModel> _list = [];

  List<AppModel> get list => _list;

  Future fetchData(int id) async {
    var response = await http.get(
      Uri.parse(AppData.url + 'action=getProductData&id=${id.toString()}'),
    );

    List data = jsonDecode(response.body);

    List<AppModel> loaded = [];

    for (int i = 0; i < data.length; i++) {
      var result = AppModel.fromJson(data[i]);

      loaded.add(result);
    }

    _list = loaded;
    notifyListeners();
  }
}
