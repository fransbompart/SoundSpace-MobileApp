import '../../domain/entities/album.dart';

abstract class AlbumUseCases {
  Future<List<Album>> getAlbums(int page, int perPage);
  Future<List<Album>> getAlbumsByArtist(int page, int perPage);
}
