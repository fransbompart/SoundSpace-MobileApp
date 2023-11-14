import 'package:flutter/material.dart';
import '../../../domain/artist.dart';
import '../../repositories/api_repository.dart';

class ArtistProvider extends ChangeNotifier {
  final ApiRepository repository;
  String? bannerImgUrl;
  List<Artist>? trendingArtists;
  Artist? currentArtist;

  ArtistProvider({required this.repository});

  Future<void> loadInitState() async {
    bannerImgUrl = await getPromotionalBanner();
    trendingArtists = await getTrendingArtists();
    notifyListeners();
  }

  Future<List<Artist>?> getTrendingArtists() async {
    return await repository.getTrendingArtists();
  }

  Future<String?> getPromotionalBanner() async {
    return await repository.getPromotionalBanner();
  }

  void updateCurrentArtist(Artist artist) {
    currentArtist = artist;
    notifyListeners();
  }
}
