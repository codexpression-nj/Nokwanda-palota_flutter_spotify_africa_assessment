import 'package:flutter_spotify_africa_assessment/features/models/artist.dart';
import 'package:flutter_spotify_africa_assessment/features/models/track.dart';

class Playlist {
  final String name;
  final String description;
  final int followers;
  final String images;
  final List<Track> tracks;
  final List<Artist> artists;

  Playlist(
      {required this.name,
      required this.description,
      required this.followers,
      required this.images,
      required this.tracks,
      required this.artists});

  factory Playlist.fromJson(Map<String, dynamic> json) {
    final tracksData = json['tracks']['items'] as List<dynamic>;
    final tracks = tracksData.map((track) => Track.fromJson(track)).toList();
    // print(tracks);
    final artistsData =
        json['tracks']['items'][0]['track']['artists'] as List<dynamic>;
    final artist =
        artistsData.map((artist) => Artist.fromJson(artist)).toList();

    for (final art in artist) {
      // ignore: avoid_print
      print('Artist: from zzzzzz ${art.name}');
      // ignore: avoid_print
      print('Image URL: ${art.imageUrl}');
    }

    return Playlist(
        name: json['name'],
        description: json['description'],
        followers: json['followers']['total'],
        images: json['images'][0]['url'],
        // trackartist :json['track']['album/']
        tracks: tracks,
        artists: artist
        // images: List<String>.from(json['images'].map((image) => image['url'])),
        );
  }
}
