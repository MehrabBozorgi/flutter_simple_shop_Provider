import 'package:flutter/material.dart';
import 'package:small_project_with_provider/model/app.dart';

class Detail_size extends StatelessWidget {
  const Detail_size({required this.appModel});

  final AppModel appModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 20),
      child: Row(
        children: [
          Text(
            'Size : ',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            appModel.size,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' MB',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}