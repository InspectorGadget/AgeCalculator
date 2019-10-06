import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedYear, age;

  void _showDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: DateTime(2019),
      lastDate: DateTime.now()).then((DateTime dt) {
        setState(() {
          selectedYear = dt.year;
          age = (2019 - selectedYear).toInt(); 
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlineButton(
            child: Text(selectedYear != null ? selectedYear.toString() : "Please select your Year of Birth"),
            borderSide: BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
            onPressed: () {
              _showDate();
            },
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Text(
            age != null ? "You are $age year old!" : ""
          )
        ],
      ),
    );
  }
}
