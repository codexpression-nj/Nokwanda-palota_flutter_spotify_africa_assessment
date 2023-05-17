import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/models/artist.dart';

import '../../../services/spotify_api.dart';

class ArtistList extends StatefulWidget {
  const ArtistList({super.key, required this.artist});
  final List<Artist> artist;

  @override
  State<ArtistList> createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchArtists(widget.artist[0].id);
    //  for (final artist in artists) {
//     // ignore: avoid_print
//     print('Artist: ${artist.name}');
//     // ignore: avoid_print
//     print('Image URL: ${artist.imageUrl}');
//   }
    // print(track[1].name);
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: widget.artist.length,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        // scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          height: 120,
          width: 120,
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            Center(child: Text(widget.artist[index].name)),
            // Center(
            //   child: FutureBuilder(
            //     future: fetchArtists(widget.artist[index].id),
            //     builder: (context, snapshot) {
            //       return Text(snapshot.data!.);
            //     },
            //   ),
            // )
          ]),
        ),
      ),
    );
  }
}
