import 'package:flutter/material.dart';
import 'package:small_project_with_provider/model/app.dart';

class Detail_icon extends StatelessWidget {
  const Detail_icon({required this.appModel});

  final AppModel appModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Hero(
          tag: 'pic',
          child: Image(
            image: NetworkImage(
              appModel.icon,
            ),
            width: 150,
          ),
        ),
      ),
    );
  }
}