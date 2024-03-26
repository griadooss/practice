import 'package:flutter/material.dart';
import './models/location.dart';

class LocationDetail extends StatelessWidget {
  final Location location;
  const LocationDetail({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          location.name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(location),
        ),
      ),
    );
  }

  List<Widget> _renderBody(Location location) {
    var result = <Widget>[];

    result.add(_bannerImage(location.urlink, 250));
    result.addAll(_renderFacts(location));
    return result;
  }

  List<Widget> _renderFacts(Location location) {
    var result = <Widget>[];

    for (int i = 0; i < location.facts.length; i++) {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionDetail(location.facts[i].detail));
    }
    return result;
  }

  Widget _sectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 25.0),
      ),
    );
  }

  Widget _sectionDetail(String detail) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35.0, 0.0, 15.0, 5.0),
      child: Text(
        detail,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 15.0,color: Colors.blueGrey),
      ),
    );
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(location.urlink, fit: BoxFit.fitWidth),
    );
  }
}
