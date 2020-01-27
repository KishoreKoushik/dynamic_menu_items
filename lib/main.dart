import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Dynamic menu example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  static List studentsMenu = [
    {'name': 'Menu for Student 1', 'id': '1'},
    {'name': 'Menu for Student 2', 'id': '2'},
    {'name': 'Menu for Student 3', 'id': '3'}
  ];

  static List teachersMenu = [
    {'name': 'Menu for Teacher 1', 'id': '1'},
    {'name': 'Menu for Teacher 2', 'id': '2'},
    {'name': 'Menu for Teacher 3', 'id': '3'}
  ];

  bool toggleValue = true;
  List menuItems = studentsMenu;

  _onChangeOfToggle(bool value) {
    setState(() {
      toggleValue = value;
      if (toggleValue) {
        menuItems = studentsMenu;
      } else {
        menuItems = teachersMenu;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView.separated(
          itemCount: menuItems.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return ListTile(
              title: new Text(menuItems[index]['name']),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
      body: new Container(
        alignment: Alignment.topRight,
        child: new Column(
          children: <Widget>[
            new Switch(
              value: toggleValue,
              onChanged: _onChangeOfToggle,
            ),
            new Text(
              'Toggle the switch to change the menu items',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
