import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/audio_player_provider.dart';

class PlayerProgressBar extends StatelessWidget {
  const PlayerProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    final playerProvider = context.watch<AudioPlayerProvider>();

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 4,
        thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius:
                10.0), // Cambia esto para modificar el tamaño del pulgar
      ),
      child: Slider(
        value: playerProvider.player.position.inSeconds.toDouble(),
        onChanged: (value) async {
          await playerProvider.seek(Duration(seconds: value.toInt()));
        },
        min: 0,
        max: (playerProvider.player.duration != null)
            ? playerProvider.player.duration!.inSeconds.toDouble()
            : 0,
        inactiveColor: const Color.fromARGB(255, 33, 31, 34),
        activeColor: const Color.fromARGB(255, 53, 44, 57),
      ),
    );
  }
}
