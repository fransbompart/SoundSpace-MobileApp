import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:soundspace_mobileapp/domain/playlist.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/playlist/playlist_page.dart';

import '../../../../../domain/album.dart';

class AlbumsCarousel extends StatefulWidget {
  final List<Album> albums;

  const AlbumsCarousel({super.key, required this.albums});

  @override
  State<AlbumsCarousel> createState() => _AlbumsCarouselState();
}

class _AlbumsCarouselState extends State<AlbumsCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<_AlbumCard> albumsCard =
        widget.albums.map((album) => _AlbumCard(album: album)).toList();

    return Gallery3D(
      controller:
          Gallery3DController(itemCount: widget.albums.length, autoLoop: false),
      width: size.width,
      height: 150,
      onItemChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemConfig: const GalleryItemConfig(
          width: 150,
          height: 150,
          radius: 10,
          shadows: [
            BoxShadow(
                color: Color.fromARGB(144, 23, 22, 22),
                offset: Offset(2, 0),
                blurRadius: 20.0)
          ]),
      itemBuilder: (context, index) => albumsCard[index],
      onClickItem: (value) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlaylistPage(
                      playlist: Playlist(
                          id: albumsCard[value].album.id,
                          name: albumsCard[value].album.name,
                          iconPath: albumsCard[value].album.imageURL),
                    )));
      },
    );
  }
}

class _AlbumCard extends StatelessWidget {
  final Album album;
  const _AlbumCard({required this.album});

  @override
  Widget build(BuildContext context) {
    bool imageMethod = false;

    if (album.id == 'id') imageMethod = true;

    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: imageMethod
            ? Image(
                image: AssetImage(album.imageURL),
                fit: BoxFit.cover,
              )
            : Image.network(
                album.imageURL,
                fit: BoxFit.cover,
              ));
  }
}
