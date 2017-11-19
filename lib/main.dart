import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: 'Porcupine App',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new OperationList(title: 'Zvol si test')
  ));
}

class OperationList extends StatefulWidget {
  final String title;

  OperationList({Key key, this.title}) : super(key: key);

  @override
  _OperationListState createState() => new _OperationListState();
}

class _OperationListState extends State<OperationList> {
  bool _addition = true;
  bool _multiplication = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(widget.title)),
        body: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text(
                  'Sčítání:',
                ),
                new Switch(
                    value: _addition,
                    onChanged: (bool newValue) {
                      setState(() {
                        _addition = newValue;
                      });
                    }),
                new Text(
                  'Násobení:',
                ),
                new Switch(
                    value: _multiplication,
                    onChanged: (bool newValue) {
                      setState(() {
                        _multiplication = newValue;
                      });
                    }),
              ],
            )
          ],
        ));
  }
}
