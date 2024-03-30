import 'package:audioplayers/audioplayers.dart';

class TonePlay {
  static const int checkInPlay = 0;
  static const int checkInLatePlay = 1;
  static const int checkOutPlay = 2;

  TonePlay(int index) {
    final player = AudioPlayer();
    String alarmAudioPath = getRelatedAudio(index);
    player.play(AssetSource(alarmAudioPath));
  }

  String getRelatedAudio(int index) {
    switch (index) {
      case checkInPlay:
        return "sounds/check_in_sound.wav";
      case checkInLatePlay:
        return "sounds/check_in_late_sound.wav";
      case checkOutPlay:
        return "sounds/check_out_sound.mp3";
    }
    return "";
  }
}
