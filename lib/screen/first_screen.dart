import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_project_with_provider/provider/ThemeChanger.dart';
import 'package:small_project_with_provider/provider/appProvider.dart';
import 'DrawerScreen.dart';
import 'First/first_screen_item.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger =
        Provider.of<ThemeChanger>(context, listen: false);

    final app = Provider.of<AppProvider>(context, listen: false);
    app.fetchData();
    return Consumer<AppProvider>(
      builder: (context, value, child) => Scaffold(
        //برای کنترل استایل و حجم دراور
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
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(200),
                ),
              ),
              child: Text(''),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: value.list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => FirstScreenItem(
                  value.list[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
