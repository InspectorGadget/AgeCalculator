import 'package:age_calculator/data/storage.dart';
import 'package:age_calculator/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  void initState() {
    Storage().getDarkThemePref().then((value) {
      if (value != null) {
        setState(() {
         isDark = value; 
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Age Calculator"),
          actions: <Widget>[
            Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  Storage().setDarkThemePref(value);
                  isDark = value;
                });
              },
            )
          ],
        ),
        body: HomePage(),
      ),
    );
  }
}
