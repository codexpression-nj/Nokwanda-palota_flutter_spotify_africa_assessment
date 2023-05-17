import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/about/presentation/components/artists_list.dart';
import 'package:flutter_spotify_africa_assessment/features/about/presentation/components/playlist_header.dart';
import 'package:flutter_spotify_africa_assessment/features/about/presentation/components/track_list.dart';
import 'package:flutter_spotify_africa_assessment/features/models/playlist_model.dart';
import 'package:flutter_spotify_africa_assessment/features/services/spotify_api.dart';

//TODO: complete this page - you may choose to change it to a stateful widget if necessary
class SpotifyPlaylist extends StatefulWidget {
  final String playlistId;
  // late Future<List<Playlist>> futurePlaylist;

  const SpotifyPlaylist({Key? key, required this.playlistId}) : super(key: key);

  @override
  State<SpotifyPlaylist> createState() => _SpotifyPlaylistState();
}

class _SpotifyPlaylistState extends State<SpotifyPlaylist> {
  late Future<Playlist> futurePlaylist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    futurePlaylist = fetchPlaylist(widget.playlistId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder(
              future: futurePlaylist,
              builder:
                  (BuildContext context, AsyncSnapshot<Playlist> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [PlaylistHeader(playlistData: snapshot.data!)],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),

          //collect and displaying tracks from playlist
          Flexible(
              child: FutureBuilder<Playlist>(
            future: fetchPlaylist(widget.playlistId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return (TrackList(
                  tracks: snapshot.data!.tracks,
                ));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
          //collect and display featured artists
          SizedBox(
            height: 150,
            child: ListView.builder(
              // itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                  height: 120,
                  width: 120,
                  margin: const EdgeInsets.all(10),
                  child: FutureBuilder<Playlist>(
                    future: fetchPlaylist(widget.playlistId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return (ArtistList(artist: snapshot.data!.artists));
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}
