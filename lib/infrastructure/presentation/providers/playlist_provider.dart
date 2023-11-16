import 'package:flutter/material.dart';
import 'package:soundspace_mobileapp/domain/song.dart';

import '../../../domain/playlist.dart';
import '../../repositories/api_repository.dart';

class PlaylistProvider extends ChangeNotifier {
  final ApiRepository repository;
  List<Playlist>? playlists;
  String? creator;
  String? songs;
  String? duration;
  List<Song>? playlistSongs;

  PlaylistProvider({required this.repository});

  Future<void> loadInitState() async {
    playlists = await getTrendingPlaylists();
    notifyListeners();
  }

  Future<List<Playlist>?> getTrendingPlaylists() async {
    return await repository.getPlaylists();
  }

  Future<void> getPlaylistCreator(String id) async {
    creator = await repository.getPlaylistCreator(id);
  }

  Future<void> getPlaylistSongs(String id) async {
    songs = await repository.getPlaylistSongs(id);
  }

  Future<void> getPlaylistDuration(String id) async {
    duration = await repository.getPlaylistDuration(id);
  }

  Future<void> getSongsByPlaylist(String id) async {
    playlistSongs = await repository.getSongsByPlaylist(id);
  }
}
