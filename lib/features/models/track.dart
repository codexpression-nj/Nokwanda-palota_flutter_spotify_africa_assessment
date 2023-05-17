class Track {
  final String name;
  // ignore: non_constant_identifier_names
  final int track_duration;
  final String image;
  final String artist;
  // final List artist

  Track(
      {required this.name,
      // ignore: non_constant_identifier_names
      required this.track_duration,
      required this.image,
      required this.artist});

  factory Track.fromJson(Map<String, dynamic> json) {
    // print(artist[0].name);
    return Track(
        name: json['track']['name'],
        track_duration: json['track']['duration_ms'],
        image: json['track']['album']['images'][2]['url'],
        artist: json['track']['artists'][0]['name']
        // artists: artist,

        // artists: json['track']['artists']['name'],
        );
  }
}
