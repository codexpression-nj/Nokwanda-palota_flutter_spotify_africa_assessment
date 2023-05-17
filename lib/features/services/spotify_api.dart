import 'dart:convert';

import 'package:flutter_spotify_africa_assessment/features/models/artist.dart';
import 'package:flutter_spotify_africa_assessment/features/models/categories_model.dart';
import 'package:flutter_spotify_africa_assessment/features/models/category_model.dart';
import 'package:flutter_spotify_africa_assessment/features/models/playlist_model.dart';
import 'package:http/http.dart' as http;
//move the IP to .env class

Map<String, String> userHeader = {
  "x-functions-key": '_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ=='
};

Future<List<Categories>> fetchCategories() async {
  var client = http.Client();
  final response = await client.get(
      Uri.parse(
          'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/browse/categories/afro/playlists'),
      headers: userHeader);

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final playlistItems = jsonResponse['playlists']['items'];
    if (playlistItems is List) {
      return playlistItems.map((item) {
        return Categories(
          name: item['name'],
          description: item['description'],
          imageUrl: item['images'][0]['url'],
          id: item['id'],
        );
      }).toList();
    } else {
      throw Exception(response.statusCode);
    }
  } else {
    throw Exception('Failed to fetch playlists from API');
  }
}

Future<CategoyModel> fetchCategory(String categoryId) async {
  var client = http.Client();
  final response = await client.get(
      Uri.parse(
          'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/browse/categories/$categoryId'),
      headers: userHeader);

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final category = jsonResponse;

    return CategoyModel.fromJson(category);
  } else {
    throw Exception(response.statusCode);
  }
}

Future<Playlist> fetchPlaylist(String playlistId) async {
  // ignore: avoid_print
  print('playlist id is ==== $playlistId');
  var client = http.Client();
  final response = await client.get(
      Uri.parse(
          'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/playlists/$playlistId'),
      headers: userHeader);

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final playlistItems = jsonResponse;

    return Playlist.fromJson(playlistItems);
  } else {
    throw Exception(response.statusCode);
  }
}

Future<String> fetchArtists(String artistId) async {
  // ignore: avoid_print
  artistId = '3ZpEKRjHaHANcpk10u6Ntq';
  print('the id is == >$artistId');
  final String img;
  final response = await http.get(
      Uri.parse(
          'https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/artists/$artistId'),
      headers: userHeader);
  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);
    // ignore: avoid_print, prefer_interpolation_to_compose_strings
    // print('body response of images' + jsonBody);
    img = jsonBody['images'][0]['url'];
  } else {
    throw Exception(response.statusCode);
  }

  return img;
}
