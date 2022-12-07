class Details {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late String origin;
  late String location;
  late String image;

  Details({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      status: json['status'] ?? "",
      species: json['species'] ?? "",
      type: json['type'] ?? "",
      gender: json['gender'] ?? "",
      origin: json['origin'] ?? "",
      location: json['location'] ?? "",
      image: json['image'] ?? "",
    );
  }
}
