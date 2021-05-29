import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:small_project_with_provider/model/app.dart';

class Detail_Description extends StatelessWidget {
  const Detail_Description({required this.appModel});

  final AppModel appModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      width: double.infinity,
      child: ExpandText(
        appModel.description,
        maxLines: 5,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}