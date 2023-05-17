class CategoyModel {
  final String icon;
  final String name;
  final String id;

  CategoyModel({
    required this.icon,
    required this.name,
    required this.id,
  });
  factory CategoyModel.fromJson(Map<String, dynamic> json) => CategoyModel(
        icon: json["icons"][0]['url'],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "name": name,
        "id": id,
      };
}
