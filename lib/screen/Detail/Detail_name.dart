import 'package:flutter/material.dart';
import 'package:small_project_with_provider/model/app.dart';

class Detail_name extends StatelessWidget {

  const Detail_name({required this.appModel});

  final AppModel appModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      width: double.infinity,
      child: Text(
        appModel.name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}