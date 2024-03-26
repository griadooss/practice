import 'location_fact.dart';

class Location {
  final String name;
  final String urlink;
  final List<LocationFact> facts;

  //Constructor
  Location({required this.name, required this.urlink, required this.facts});
}
