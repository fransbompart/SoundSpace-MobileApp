import 'package:flutter/material.dart';

class MusicTrackItem extends StatelessWidget {
  const MusicTrackItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 9),
      child: Card(
        elevation: 2.0,
        color: const Color.fromARGB(33, 255, 255, 255),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                //imagen
                width: size.width * 0.2,
                height: size.width * 0.2,
                decoration: const BoxDecoration(color: Colors.amber),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(14),
              child: Column(children: [
                Text(
                  'Song',
                ),
                Text('Artist')
              ]),
            ),
            Expanded(child: Container()),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('1:00'),
                  SizedBox(width: 6),
                  Icon(
                    Icons.play_arrow_sharp,
                    color: Color(0xff1de1ee),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
