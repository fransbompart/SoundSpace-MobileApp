import 'package:flutter/material.dart';

import '../../../domain/artist.dart';
import '../../repositories/api_repository.dart';

class SearchArtistProvider extends ChangeNotifier {
  final ApiRepository repository;
  List<Artist>? searchArtists;

  SearchArtistProvider({required this.repository});

  Future<void> loadSearch(String searchTerm) async {
    searchArtists = await getSearchArtists(searchTerm);
    notifyListeners();
  }

  Future<List<Artist>?> getSearchArtists(String searchTerm) async {
    return await repository.getSearchArtists(searchTerm);
  }
}
