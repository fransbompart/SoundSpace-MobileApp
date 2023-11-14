import 'package:dio/dio.dart';
import '../../domain/album.dart';
import '../../domain/artist.dart';
import '../../domain/playlist.dart';
import '../../domain/song.dart';

class ApiRepository {
  final Dio dio = Dio();

  Future<String?> getPromotionalBanner() async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/publicidad");

      if (response.statusCode == 200) {
        return response.data['data']['referencia_imagen'];
      }
    } catch (e) {
      print('$e');
    }
    return null;
  }

  Future<List<Playlist>?> getPlaylists() async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/playlist/top_playlists?type=playlist");

      if (response.statusCode == 200) {
        final playlistJson = response.data["data"];

        List<Playlist> newPlaylists = playlistJson
            .map<Playlist>((playlist) => Playlist(
                id: playlist['codigo_playlist'],
                name: playlist['nombre'],
                iconPath: playlist['referencia_imagen']))
            .toList();

        return newPlaylists;
      } else {
        throw Exception('Failed to load playlists');
      }
    } catch (e) {
      print("$e");
    }

    return null;
  }

  Future<List<Album>?> getTrendingAlbums() async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/playlist/top_playlists?type=album");

      if (response.statusCode == 200) {
        final playlistJson = response.data["data"];

        List<Album> newPlaylists = playlistJson
            .map<Album>((album) => Album(
                id: album['codigo_playlist'],
                name: album['nombre'],
                imageURL: album['referencia_imagen']))
            .toList();

        return newPlaylists;
      } else {
        throw Exception('Failed to load playlists');
      }
    } catch (e) {
      print("$e");
    }
    return null;
  }

  Future<List<Artist>?> getTrendingArtists() async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/artists/top_artists");

      if (response.statusCode == 200) {
        final artistsJson = response.data["data"];

        List<Artist> newArtists = artistsJson
            .map<Artist>((artist) => Artist(
                  id: artist['codigo_artista'],
                  name: artist['nombre_artista'],
                  imageURL: artist['referencia_imagen'],
                ))
            .toList();

        return newArtists;
      } else {
        throw Exception('Failed to load playlists');
      }
    } catch (e) {
      print("$e");
    }
    return null;
  }

  Future<List<Album>?> getAlbumsByArtist(String id) async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/artists/albums/$id");

      if (response.statusCode == 200) {
        final albumsJson = response.data['data']['playlists'];

        List<Album> newAlbumsByArtist = albumsJson
            .map<Album>((album) => Album(
                id: album['playlist']['codigo_playlist'],
                name: album['playlist']['nombre'],
                imageURL: album['playlist']['referencia_imagen']))
            .toList();

        if (newAlbumsByArtist.length == 2) {
          newAlbumsByArtist.add(Album(
              id: 'id', name: 'name', imageURL: 'images/coming_soon.jpg'));
        } else if (newAlbumsByArtist.length == 1) {
          newAlbumsByArtist.add(Album(
              id: 'id', name: 'name', imageURL: 'images/coming_soon.jpg'));
          newAlbumsByArtist.add(Album(
              id: 'id', name: 'name', imageURL: 'images/coming_soon.jpg'));
        } else if (newAlbumsByArtist.length == 0) {
          newAlbumsByArtist.add(Album(
              id: 'id', name: 'name', imageURL: 'images/coming_soon.jpg'));
          newAlbumsByArtist.add(Album(
              id: 'id', name: 'name', imageURL: 'images/coming_soon.jpg'));
          newAlbumsByArtist.add(Album(
              id: 'id', name: 'name', imageURL: 'images/coming_soon.jpg'));
        }

        return newAlbumsByArtist;
      }
    } catch (e) {
      print("$e");
    }
    return null;
  }

  Future<List<Song>?> getSongsByArtist(String id) async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/artists/songs/$id");

      if (response.statusCode == 200) {
        List<Song> newSongs = response.data['data']['songs']
            .map<Song>((artist) => Song(
                id: artist['codigo_cancion'],
                name: artist['nombre'],
                duration: artist['duracion'],
                imageURL: artist['referencia_imagen']))
            .toList();

        return newSongs;
      } else {
        return null;
      }
    } catch (e) {
      print('$e');
    }
    return null;
  }

  Future<List<Song>?> getTracklist() async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/songs/tracklist");

      if (response.statusCode == 200) {
        List<Song> newSongs = response.data['data']
            .map<Song>((artist) => Song(
                id: artist['codigo'],
                name: artist['nombre'],
                duration: artist['duracion'],
                imageURL: artist['referencia']))
            .toList();

        return newSongs;
      } else {
        return null;
      }
    } catch (e) {
      print('$e');
    }
    return null;
  }

  Future<String?> getSong(String id) async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/songs/link/$id",
          options: Options(
            headers: {'user': '64a0c01f-3ffd-4e65-932a-3ab72156c6ae'},
          ));

      if (response.statusCode == 200) return response.data['data'];
    } catch (e) {
      print('$e');
    }
    return null;
  }

  Future<String?> logInUser(String number) async {
    try {
      final response = await dio.post(
          "https://soundspace-api-production.up.railway.app/api/auth/login",
          data: {
            'number': number,
          });

      if (response.statusCode == 200) {
        return response.data['data']['codigo_usuario'];
      }
    } catch (e) {
      print('$e');
    }
    return null;
  }
}
