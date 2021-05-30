import 'package:flutter/material.dart';
import 'package:small_project_with_provider/provider/ThemeChanger.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({required ThemeChanger themeChanger})
      : _themeChanger = themeChanger;

  final ThemeChanger _themeChanger;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DrawerHeader(
          child: Container(),
        ),
        TextButton.icon(
          icon: Icon(Icons.light_mode,color: Theme.of(context).primaryColor, ),
          label: Text('light',style: TextStyle(color: Theme.of(context).primaryColor,),),
          onPressed: () {
            _themeChanger.setTheme(
              ThemeData.light().copyWith(
                scaffoldBackgroundColor: Colors.purple[50],
                primaryColor: Colors.purple[400],
                  brightness: Brightness.light
              ),
            );
          },
        ),
        TextButton.icon(
          icon: Icon(Icons.dark_mode,color: Theme.of(context).primaryColor,),
          label: Text('dark',style: TextStyle(color: Theme.of(context).primaryColor,),),
          onPressed: () {
            _themeChanger.setTheme(
              ThemeData.dark().copyWith(
                  brightness: Brightness.dark,

                 // scaffoldBackgroundColor: Color(0xFF263238),
                primaryColor: Color(0xFF92E348),
                buttonColor: Color(0xFF92E348),
                accentColor: Color(0xFF92E348),
                textTheme: TextTheme(
                  bodyText1: TextStyle(color: Colors.white),
                  headline1: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
