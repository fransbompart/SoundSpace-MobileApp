import 'package:flutter/material.dart';

class ArtistInfo extends StatelessWidget {
  final String name;
  final String genre;
  final String albums;
  final String songs;
  final String imageURL;
  const ArtistInfo(
      {super.key,
      required this.name,
      required this.genre,
      required this.albums,
      required this.songs,
      required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageURL,
                fit: BoxFit.fill,
                width: 180,
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        genre,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$albums Album",
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "$songs Canciones",
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ]),
          ],
        ));
  }
}
