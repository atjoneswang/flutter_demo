import 'package:flutter/material.dart';
import 'package:flutter_demo/planets/models/Planet.dart';
import 'package:flutter_demo/planets/TextStyle.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new PlanetRow(planets[0]);
  }
}

class PlanetRow extends StatelessWidget {

  static Planet _planet = new Planet();
  PlanetRow(Planet planet){
    _planet = planet;
  }

  final planetThumbnail = new Container(
    margin: new EdgeInsets.symmetric(
      vertical: 16.0
    ),
    alignment: FractionalOffset.centerLeft,
    child: new Image(
        image: new AssetImage(_planet.image),
      height: 92.0,
      width: 92.0,
    ),
  );

  final planetCard = new Container(
    height: 124.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      color: new Color(0xff333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ]
    ),
  );

  final planetCardContent = new Container(
    margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
    constraints: new BoxConstraints.expand(),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(height: 4.0,),
        new Text(_planet.name,
        style: Style.headerTextStyle,),
        new Container(height: 10.0,),
        new Text(_planet.location,
        style: Style.subHeaderTextStyle,),
        new Container(
          margin: new EdgeInsets.symmetric(vertical: 8.0),
          height: 2.0,
          width: 18.0,
          color: new Color(0xff00c6ff),
        )
      ],
    ),
  );
  

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: new Stack(
        children: <Widget>[
          planetCard,
          planetThumbnail,
        ],
      ),
    );
  }
}