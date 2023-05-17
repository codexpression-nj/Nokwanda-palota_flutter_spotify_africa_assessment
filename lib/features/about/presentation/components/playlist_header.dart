import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/features/models/playlist_model.dart';

import '../../../../colors.dart';

class PlaylistHeader extends StatelessWidget {
  const PlaylistHeader({super.key, required this.playlistData});
  final Playlist playlistData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 294,
          height: 335,
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                playlistData.images,
                height: 130,
                width: 263,
                // fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Text(
          playlistData.name,
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          playlistData.description,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          '${playlistData.followers} followers',
          style: const TextStyle(fontSize: 11),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                AppColors.blue,
                AppColors.cyan,
                AppColors.green,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
