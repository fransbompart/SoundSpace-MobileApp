import 'package:flutter/material.dart';
import '../../../domain/album.dart';
import '../../repositories/api_repository.dart';

class AlbumProvider extends ChangeNotifier {
  final ApiRepository repository;
  List<Album>? trendingAlbums;
  List<Album>? albumsByArtist;

  AlbumProvider({required this.repository});

  Future<void> loadInitState() async {
    trendingAlbums = await getTrendingAlbums();
    notifyListeners();
  }

  Future<List<Album>?> getTrendingAlbums() async {
    return await repository.getTrendingAlbums();
  }

  Future<void> updateAlbumsByArtist(String id) async {
    albumsByArtist = await repository.getAlbumsByArtist(id);
    notifyListeners();
  }
}
