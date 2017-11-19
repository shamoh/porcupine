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
  bool _addition = false;
  bool _multiplication = true;
  int _count = 10;
  Set<int> _numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].toSet();

  Widget _switchesWidget() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Text('Sčítání:',
            style: Theme
                .of(context)
                .textTheme
                .headline),
        new Switch(
            value: _addition,
            onChanged: (bool newValue) {
              setState(() {
                _addition = newValue;
              });
            }),
        new Text('Násobení:',
            style: Theme
                .of(context)
                .textTheme
                .headline),
        new Switch(
            value: _multiplication,
            onChanged: (bool newValue) {
              setState(() {
                _multiplication = newValue;
              });
            }),
      ],
    );
  }

  Widget _countWidget() {
    final int maxNumber = 30;
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Text('Počet:',
            style: Theme
                .of(context)
                .textTheme
                .headline),
        new Slider(
            value: _count.toDouble(),
            min: 1.0,
            max: maxNumber.toDouble(),
            divisions: maxNumber,
            onChanged: (double newValue) {
              setState(() {
                _count = newValue.toInt();
              });
            }
        ),
        new Text('$_count',
            style: Theme
                .of(context)
                .textTheme
                .headline),
      ],
    );
  }

  Widget _numbers10Widget() {
    return new Column(
        children: <Widget>[
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _createToggleButton(1),
                _createToggleButton(2),
                _createToggleButton(3),
                _createToggleButton(4),
                _createToggleButton(5),
              ]
          ),
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _createToggleButton(6),
                _createToggleButton(7),
                _createToggleButton(8),
                _createToggleButton(9),
                _createToggleButton(10),
              ]
          ),
          new Divider(),
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _createToggleButton(11),
                _createToggleButton(12),
                _createToggleButton(13),
                _createToggleButton(14),
                _createToggleButton(15),
              ]
          ),
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _createToggleButton(16),
                _createToggleButton(17),
                _createToggleButton(18),
                _createToggleButton(19),
                _createToggleButton(20),
              ]
          ),
        ]
    );
  }

  Widget _createToggleButton(int number) {
    return new _ToggleButton(
      number: number,
      on: _numbers.contains(number),
      onOn: () => setState(() => _numbers.add(number)),
      onOff: () => setState(() => _numbers.remove(number)),
    );
  }

  Widget _runWidget() {
    return new FloatingActionButton(
      onPressed: () {
        _count++;
      },
      tooltip: 'Spustit test',
      child: new Icon(Icons.school),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title,
          style: Theme
              .of(context)
              .textTheme
              .title)),
      body: new Column(
        children: <Widget>[
          _switchesWidget(),
          new Divider(),
          _countWidget(),
          new Divider(),
          _numbers10Widget(),
        ],
      ),
      floatingActionButton: _runWidget(),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final int number;
  final bool on;
  final VoidCallback onOn;
  final VoidCallback onOff;

  _ToggleButton({this.number, this.on, this.onOn, this.onOff});

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new FlatButton(
            onPressed: on ? onOff : onOn,
            color: on ? Colors.green : Colors.grey,
            child: new Text('$number',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline)
        )
    );
  }

}
