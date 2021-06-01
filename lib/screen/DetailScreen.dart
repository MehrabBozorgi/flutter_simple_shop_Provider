import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_project_with_provider/model/app.dart';
import 'package:small_project_with_provider/provider/ThemeChanger.dart';
import 'package:small_project_with_provider/screen/DrawerScreen.dart';
import 'package:small_project_with_provider/screen/Detail/pageView/page_view_screen.dart';
import 'Detail/DetailButton.dart';
import 'Detail/Detail_Description.dart';
import 'Detail/Detail_icon.dart';
import 'Detail/Detail_name.dart';
import 'Detail/Detail_size.dart';

class DetailScreen extends StatelessWidget {
  AppModel appModel;

  DetailScreen(this.appModel);

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger =
        Provider.of<ThemeChanger>(context, listen: false);
    // final provider=Provider.of<DetailProvider>(context,listen: false);
    // provider.fetchData(idM);
    return Scaffold(
      drawer: Container(
        width: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(200),
            topRight: Radius.circular(200),
          ),
          child: Drawer(
            child: DrawerScreen(themeChanger: _themeChanger),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_forward)),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              PageViewScreen(appModel.id),
              Detail_icon(appModel: appModel),
              DetailButton(
                appModel: appModel,
              ),
              Detail_name(appModel: appModel),
              Detail_size(appModel: appModel),
              Detail_Description(appModel: appModel)
            ],
          ),
        ),
      ),
    );
  }
}
