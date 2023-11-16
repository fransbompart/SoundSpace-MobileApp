import 'package:dio/dio.dart';
import '../../domain/album.dart';
import '../../domain/artist.dart';
import '../../domain/playlist.dart';
import '../../domain/song.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<List<Song>?> getSongsByPlaylist(String id) async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/playlist/$id");

      if (response.statusCode == 200) {
        List<Song> newSongs = response.data['data']['canciones']
            .map<Song>((song) => Song(
                id: song['codigo_cancion'],
                name: song['nombre_cancion'],
                duration: song['duracion'],
                imageURL: ''))
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

  Future<String> getPlaylistCreator(String id) async {
    try {
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/playlist/$id");
      if (response.statusCode == 200) {
        List creators = response.data['data']['creadores']
            .map((c) => (c['nombre_artista']))
            .toList();

        print(creators[0]);
        return creators[0];
      } else {
        return '';
      }
    } catch (e) {}

    return '';
  }

  Future<List<Artist>?> getSearchArtists(String searchTerm) async {
    try {
      String ruta =
          "https://soundspace-api-production.up.railway.app/api/search/$searchTerm?type=artist";
      final response = await dio.get(ruta);

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
        throw Exception('Failed to load artists');
      }
    } catch (e) {
      print("$e");
    }
    return null;
  }

  Future<String> getPlaylistSongs(String id) async {
    try {
      print(id);
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/playlist/$id");
      if (response.statusCode == 200) {
        List songs =
            response.data['data']['canciones'].map((s) => (s)).toList();
        print(songs);
        print(id);
        return songs.length.toString();
      } else {
        return '';
      }
    } catch (e) {}

    return '';
  }

  Future<String> getPlaylistDuration(String id) async {
    try {
      print(id);
      final response = await dio.get(
          "https://soundspace-api-production.up.railway.app/api/playlist/$id");
      if (response.statusCode == 200) {
        return response.data['data']['duracion'];
      } else {
        return '';
      }
    } catch (e) {}

    return '';
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
      final response = await http.post(
        Uri.parse(
            'https://soundspace-api-production.up.railway.app/api/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'number': number,
        }),
      );
      if (jsonDecode(response.body)['statusCode'] == 200) {
        // Si el servidor devuelve una respuesta OK, extraemos el código de usuario.
        return jsonDecode(response.body)['data']['codigo_usuario'];
      }
    } catch (e) {
      print('$e');
    }
    return null;
  }

  Future<String?> signUpUser(String number, String operadora) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://soundspace-api-production.up.railway.app/api/auth/validate_operator'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'number': number,
          "operadoraId": operadora,
        }),
      );
      if (jsonDecode(response.body)['statusCode'] == 200) {
        // Si el servidor devuelve una respuesta OK, extraemos el código de usuario.
        return jsonDecode(response.body)['codigo_usuario'];
      }
    } catch (e) {
      print('$e');
    }
    return null;
  }

  Future<String> getError(String number, String operadora) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://soundspace-api-production.up.railway.app/api/auth/validate_operator'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'number': number,
          "operadoraId": operadora,
        }),
      );

      return (jsonDecode(response.body)['message']);
    } catch (e) {
      print('$e');
    }
    return 'Error de conexión';
  }
}
