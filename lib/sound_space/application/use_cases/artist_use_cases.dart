import 'package:flutter_application_4/sound_space/domain/entities/artist.dart';

abstract class IArtistUseCases {
  Future<List<Artist>> getArtists(int page, int perPage);
}
