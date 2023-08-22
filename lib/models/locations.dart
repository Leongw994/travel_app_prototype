class Location {
  String name;
  String price;
  String imagePath;
  String location;

  Location(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.location});

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _location => location;
}
