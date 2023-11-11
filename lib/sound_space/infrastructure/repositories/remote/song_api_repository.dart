import 'package:flutter_application_4/sound_space/domain/entities/album.dart';
import 'package:flutter_application_4/sound_space/domain/entities/artist.dart';
import 'package:flutter_application_4/sound_space/domain/entities/playlist.dart';
import 'package:flutter_application_4/sound_space/infrastructure/models/song_model.dart';
import 'package:flutter_application_4/sound_space/infrastructure/repositories/song_repository.dart';

class ApiRepository implements Repository {
  @override
  Future<List<SongModel>> getSongsByArtist(String idArtist) {
    // TODO: implement getSongsByArtist
    throw UnimplementedError();
  }

  @override
  Future<List<Album>> getAlbums() {
    // TODO: implement getAlbums
    throw UnimplementedError();
  }

  @override
  Future<List<Artist>> getArtists() {
    // TODO: implement getArtists
    throw UnimplementedError();
  }

  @override
  Future<List<Playlist>> getPlaylists() {
    // TODO: implement getPlaylists
    throw UnimplementedError();
  }
}
