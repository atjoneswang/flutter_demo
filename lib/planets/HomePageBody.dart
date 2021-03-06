import 'package:flutter/material.dart';
import 'package:flutter_demo/planets/models/Planet.dart';
import 'TextStyle.dart';
import 'DetailPage.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: new Color(0xff736ab7),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 152.0,
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => new PlanetSummary(planets[index]),
                  childCount: planets.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanetSummary extends StatelessWidget {
  final Planet _planet;
  final bool horizontal;
  PlanetSummary(this._planet, {this.horizontal = true});
  PlanetSummary.vertical(this._planet) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(horizontal ? 76.0:16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            height: 4.0,
          ),
          new Text(
            _planet.name,
            style: Style.headerTextStyle,
          ),
          new Container(
            height: 10.0,
          ),
          new Text(
            _planet.location,
            style: Style.subHeaderTextStyle,
          ),
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: new Color(0xff00c6ff),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                    'assets/images/ic_distance.png', _planet.distance),
              ),
              new Container(
                width: 32.0,
              ),
              new Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                    'assets/images/ic_gravity.png', _planet.gravity),
              )
            ],
          ),
        ],
      ),
    );

    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: 'planet-hero-${_planet.id}',
        child: new Image(
          image: new AssetImage(_planet.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );
    final planetCard = new Container(
      height: horizontal ?  124.0 : 154.0,
      margin: horizontal ? new EdgeInsets.only(left: 46.0) : new EdgeInsets.only(top: 72.0),
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
          ]),
      child: planetCardContent,
    );

    return new GestureDetector(
      onTap: horizontal ? () => Navigator.of(context).push(new PageRouteBuilder(
            pageBuilder: (_, __, ___) => new DetailPage(_planet),
            transitionsBuilder: (context,animation, secondaryAnimation, child) => new FadeTransition(opacity: animation, child: child),
          ),)  : null,
      child: new Container(
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
      ),
    );
  }

  Widget _planetValue(String image, String value) {
    return new Container(
      child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new Image.asset(
          image,
          height: 12.0,
        ),
        new Container(
          width: 8.0,
        ),
        new Text(value, style: Style.regularTextStyle),
      ]),
    );
  }
}
