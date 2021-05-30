import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_project_with_provider/provider/PageViewProvider.dart';
import 'package:small_project_with_provider/provider/ThemeChanger.dart';
import 'package:small_project_with_provider/provider/appProvider.dart';
import 'package:small_project_with_provider/provider/detail_provider.dart';
import 'package:small_project_with_provider/screen/first_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeChanger(
            ThemeData.light().copyWith(
              scaffoldBackgroundColor: Colors.purple[50],
              primaryColor: Colors.purple[400],
              brightness: Brightness.light,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageViewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailProvider(),
        ),
      ],
      child: MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      home: FirstScreen(),
    );
  }
}

// ThemeData light = ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     primaryColor: Colors.blue,
//     textTheme: TextTheme(
//       bodyText1: TextStyle(color: Colors.red),
//       headline1: TextStyle(color: Colors.red),
//     ),
//   );

// ThemeData dark = ThemeData(
//   scaffoldBackgroundColor: Color(0xFF263238),
//   primaryColor: Color(0xFF92E348),
//   buttonColor: Color(0xFF92E348),
//   accentColor: Color(0xFF92E348),
//   textTheme: TextTheme(
//     bodyText2: TextStyle(color: Colors.white),
//     headline2: TextStyle(color: Colors.white),
//   ),
// );
