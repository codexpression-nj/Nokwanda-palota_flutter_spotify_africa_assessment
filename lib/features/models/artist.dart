class Artist {
  final String name;
  final String imageUrl;
  final String id;

  Artist({required this.name, required this.imageUrl, required this.id});
  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(name: json['name'], imageUrl: 'ss', id: json['id']
        // imageUrl: json['images'][0]['url']
        // artists: json['track']['artists']['name'],
        );
  }
}
