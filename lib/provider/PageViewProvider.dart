import 'package:flutter/material.dart';
import 'package:small_project_with_provider/model/page_view.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widget/AppData.dart';

class PageViewProvider extends ChangeNotifier {
  List<PageViewModel> _list = [];

  List<PageViewModel> get list => _list;

  Future fetchData(int id) async {
    var response = await http.get(
      Uri.parse(
          AppData.url + 'action=get_sliders2&product_id=${id.toString()}'),
    );

    List data = jsonDecode(utf8.decode(response.bodyBytes));
    print(response.body);

    List<PageViewModel> loaded = [];

    for (int i = 0; i < data.length; i++) {
      var result = PageViewModel.fromJson(data[i]);
      loaded.add(result);
    }
    _list = loaded;
    notifyListeners();
  }
}
