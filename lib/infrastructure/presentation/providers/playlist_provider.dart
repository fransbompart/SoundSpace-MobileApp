import 'package:flutter/material.dart';

import '../../../domain/playlist.dart';
import '../../repositories/api_repository.dart';

class PlaylistProvider extends ChangeNotifier {
  final ApiRepository repository;
  List<Playlist>? playlists;

  PlaylistProvider({required this.repository});

  Future<void> loadInitState() async {
    playlists = await getTrendingPlaylists();
    notifyListeners();
  }

  Future<List<Playlist>?> getTrendingPlaylists() async {
    return await repository.getPlaylists();
  }
}
