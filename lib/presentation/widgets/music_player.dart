import 'package:flutter/material.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(21, 0, 0, 0), boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 30, 8, 58),
          blurRadius: 8,
        )
      ]),
      child: Column(
        children: [
          const LinearProgressIndicator(
            backgroundColor: Color.fromARGB(255, 33, 31, 34),
            value: 0.5,
            minHeight: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.play_circle_fill,
                  size: 50,
                  color: Color(0xff1de1ee),
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
          )
        ],
      ),
    );
  }
}
