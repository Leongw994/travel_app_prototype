class Location {
  String name;
  String price;
  String imagePath;
  String location;
  String description;

  Location(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.location,
      required this.description});

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _location => location;
  String get _description => description;
}
