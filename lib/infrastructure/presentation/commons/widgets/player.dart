import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import '../../providers/audio_player_provider.dart';
import 'player_progress_bar.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    final playerProvider = context.watch<AudioPlayerProvider>();

    return Stack(
      children: [
        SizedBox(
          height: 86,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                height: 10,
              ),
              Container(
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 24, 15, 35)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      _PlayerButtom(),
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
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(playerProvider.player.position
                            .toString()
                            .substring(2, 7)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 50,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const PlayerProgressBar()))
      ],
    );
  }
}

class _PlayerButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playerProvider = context.watch<AudioPlayerProvider>();
    IconData icon;
    Color color;

    switch (playerProvider.player.processingState) {
      case (ProcessingState.idle):
        icon = Icons.play_circle_fill;
        color = Colors.blueGrey;
      case ProcessingState.loading:
        icon = Icons.circle_rounded;
        color = Colors.blueGrey;
      case ProcessingState.buffering:
        icon = Icons.circle_rounded;
        color = Colors.blueGrey;
      case ProcessingState.ready:
        icon = (playerProvider.player.playing)
            ? Icons.pause_circle_filled
            : Icons.play_circle_fill;
        color = const Color(0xff1de1ee);
      case ProcessingState.completed:
        icon = Icons.play_circle_fill;
        color = Colors.blueGrey;
    }

    return IconButton(
      icon: Icon(
        icon,
        size: 50,
        color: color,
      ),
      onPressed: () async {
        playerProvider.playOrPause();
      },
    );
  }
}
