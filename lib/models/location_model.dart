class LocationModel
{
  final String? name;
  final String? address;
  final List<double>? coordinates;

  LocationModel({required this.name, required this.address, required this.coordinates});

  factory LocationModel.fromJson(Map<String,dynamic>jsonData)
  {
    return LocationModel(
        name: jsonData["name"],
        address: jsonData["address"],
      coordinates: jsonData["coordinates"]?.cast<double>(),);
  }
}
