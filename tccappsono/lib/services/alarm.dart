import 'dart:async';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:screen/screen.dart';

class Alarme {
  static AudioPlayer advancedPlayer = new AudioPlayer();
  AudioCache player = new AudioCache(fixedPlayer: advancedPlayer);
  tocar(){
    const alarmAudioPath = "sound.mp3";
    player.loop(alarmAudioPath);
  }

  stop() {
    advancedPlayer.stop();
  }


  rodar() async{
    final int helloAlarmID = 0;
    await AndroidAlarmManager.initialize();
    await AndroidAlarmManager.periodic(const Duration(minutes: 1), helloAlarmID, tocar);
  }


  teste (int duration){
    Timer(Duration(seconds: duration), () {
      Screen.keepOn(true);
      tocar();
      Timer(Duration(seconds: 10), (){
        Screen.keepOn(false);
      });
    });
  }

  setalarm(String h, String m, String s){

  
  }
}