import 'package:flutter/material.dart';
import '../../../domain/song.dart';
import '../../repositories/api_repository.dart';

class SongProvider extends ChangeNotifier {
  final ApiRepository repository;
  String? currentSong;
  List<Song>? songsByAlbum;
  List<Song>? songsByArtist;
  List<Song>? tracklist;

  SongProvider({required this.repository});

  Future<void> loadInitState() async {
    tracklist = await getTracklist();
    notifyListeners();
  }

  Future<void> updateCurrentSong(String id) async {
    currentSong = await repository.getSong(id);
    notifyListeners();
  }

  // Future<void> updateSongsByAlbum(String id) async {
  //   songsByAlbum = await repository.getSongsByAlbum(id);
  //   notifyListeners();
  // }

  Future<void> updateSongsByArtist(String id) async {
    songsByArtist = await repository.getSongsByArtist(id);
    notifyListeners();
  }

  Future<List<Song>?> getTracklist() async {
    return await repository.getTracklist();
  }
}
