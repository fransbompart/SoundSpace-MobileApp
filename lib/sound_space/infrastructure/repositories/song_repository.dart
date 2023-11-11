import 'package:flutter_application_4/sound_space/domain/entities/artist.dart';
import 'package:flutter_application_4/sound_space/domain/entities/playlist.dart';
import 'package:flutter_application_4/sound_space/infrastructure/models/song_model.dart';

import '../../domain/entities/album.dart';

abstract class Repository {
  Future<List<SongModel>> getSongsByArtist(String idArtist);
  Future<List<Artist>> getArtists();
  Future<List<Playlist>> getPlaylists();
  Future<List<Album>> getAlbums();
}
