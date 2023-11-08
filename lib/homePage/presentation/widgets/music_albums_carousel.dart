import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';

class MusicAlbumsCarousel extends StatefulWidget {
  final List<Widget> albums;
  const MusicAlbumsCarousel({Key? key, required this.albums}) : super(key: key);

  @override
  State<MusicAlbumsCarousel> createState() => _MusicAlbumsCarouselState();
}

class _MusicAlbumsCarouselState extends State<MusicAlbumsCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
      itemBuilder: (context, index) => widget.albums[index],
    );
  }
}
