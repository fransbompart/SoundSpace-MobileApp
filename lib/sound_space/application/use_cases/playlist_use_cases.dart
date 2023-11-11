import 'package:flutter_application_4/sound_space/domain/entities/playlist.dart';

abstract class IPlaylistUseCases {
  Future<List<Playlist>> getPlaylists(int page, int perPage);
}
