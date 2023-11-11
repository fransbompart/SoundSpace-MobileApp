import 'package:flutter_application_4/sound_space/domain/entities/song.dart';
import 'package:flutter_application_4/sound_space/infrastructure/repositories/song_repository.dart';

abstract class SongUseCases {
  // @protected
  final Repository repository;

  SongUseCases({required this.repository});

  Future<List<Song>> getSongsByArtist(String id);
  // Future<List<SongEntity>> getSongsByPlaylist(String idPlaylist);
  // Future<List<SongEntity>> getSongsByAlbum(String idAlbum);
  // Future<List<SongEntity>> getSongsByTracklist(String idTracklist);
}
