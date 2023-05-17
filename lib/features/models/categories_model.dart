class Categories {
  final String name;
  final String description;
  final String imageUrl;
  final String id;

  Categories({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.id,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        id: json["playlistUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "id": id,
      };
}
