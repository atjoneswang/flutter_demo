import 'package:flutter/material.dart';

class Layout1HomePage extends StatefulWidget {
  Layout1HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Layout1HomePageState createState() => new _Layout1HomePageState();
}

class _Layout1HomePageState extends State<Layout1HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.6,
        centerTitle: true,
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(child: new Image.asset('images/pic1.jpg'),),
            new Expanded(child: new Image.asset('images/pic2.jpg'),),
            new Expanded(child: new Image.asset('images/pic3.jpg'),),
            new Expanded(child: new Image.asset('images/pic1.jpg'),),
            new Expanded(child: new Image.asset('images/pic2.jpg'),),
          ],
        ),
      ),
    );
  }

}