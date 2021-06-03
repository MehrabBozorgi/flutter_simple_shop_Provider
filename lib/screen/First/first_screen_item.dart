import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_project_with_provider/model/app.dart';
import 'package:small_project_with_provider/screen/DetailScreen.dart';
import 'package:small_project_with_provider/widget/kConst.dart';

class FirstScreenItem extends StatelessWidget {
  AppModel appModel;

  FirstScreenItem(this.appModel);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(appModel),
              ),
            );
          },
          child: Column(
            children: [
              Card(
                shape: FirstScreenCard1,
                elevation: 10,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: NetworkImage(appModel.icon),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 10),
                color: Theme.of(context).primaryColor,
                elevation: 10,
                shape: FirstScreenCard2,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        appModel.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 10,
                      child: Text(
                        appModel.size + ' MB',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
