import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/models/track.dart';

class TrackList extends StatelessWidget {
  const TrackList({super.key, required this.tracks});
  final List<Track> tracks;

  // final List<Track> tracks;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: tracks.length,
        physics: const NeverScrollableScrollPhysics(),
        // scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = tracks[index];
          return Card(
            child: ListTile(
              leading: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 48,
                  minHeight: 48,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(item.image)),
              ),
              title: Text(item.name),
              subtitle: Text(
                item.artist,
                style: const TextStyle(fontSize: 12),
              ),
              trailing:
                  Text(((item.track_duration / 60000).toStringAsFixed(2))),
            ),
          );
        },
      ),
    );
  }
}
