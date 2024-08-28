class Place {
  final int id;
  final String name;
  final String description;
  final String imageURL;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.imageURL,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: int.tryParse(json['id'].toString()) ?? 0,  // Ensure ID is an integer
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageURL: json['imageURL'] ?? '',
    );
  }
}