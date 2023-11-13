import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';

class AudioPlayerProvider extends ChangeNotifier {
  final AudioPlayer player = AudioPlayer();
  late String path;
  Duration? duration;
  Duration? position;
  // late Duration bufferedPosition;
  late PlayerButtonState buttonState;

  void setPath(String newPath) {
    path = newPath;
  }

  Future<void> play() async {
    try {
      await player.setUrl(path);
      player.play();

      updatePlayerState();
      updateDurationStream();
      updatePositionStream();
    } catch (e) {
      print("$e");
    }
  }

  void playOrPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
    notifyListeners();
  }

  void updatePlayerState() {
    player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.buffering) {
        buttonState = PlayerButtonState.buffering;
      } else if (playerState.processingState == ProcessingState.completed) {
        player.stop();
      }
      notifyListeners();
    });
  }

  void updateDurationStream() {
    player.durationStream.listen((newDurarion) {
      notifyListeners();
    });
  }

  void updatePositionStream() {
    player.positionStream.listen((newPosition) {
      notifyListeners();
    });
  }

  Future<void> seek(Duration newPosition) async {
    await player.seek(newPosition);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }
}

enum PlayerButtonState { playing, paused, loading, buffering }
