import 'dart:async';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:screen/screen.dart';

class Alarme {
  static Timer timer, timeraux;
  static AudioPlayer advancedPlayer = new AudioPlayer();
  AudioCache player = new AudioCache(fixedPlayer: advancedPlayer);
  tocar(){
    const alarmAudioPath = "sound.mp3";
    player.loop(alarmAudioPath);
  }

  stop() {
    advancedPlayer.stop();
    timer.cancel();
    timeraux.cancel();
  }


  rodar() async{
    final int helloAlarmID = 0;
    await AndroidAlarmManager.initialize();
    await AndroidAlarmManager.periodic(const Duration(minutes: 1), helloAlarmID, tocar);
  }


  run (int duration){
    timer = Timer(Duration(seconds: duration), () {
      Screen.keepOn(true);
      tocar();
      timeraux = Timer(Duration(seconds: 10), (){
        Screen.keepOn(false);
      });
    });
  }

  setAlarm(int h, int m){
    //Fazer a tradução de hora m e segundo pra uma quantidade de segundos que o timer vai esperar até apitar
    DateTime now = DateTime.now();
    DateTime horadeacordar = DateTime(now.year, now.month, now.day, h,m,0);
    if(now.isAfter(horadeacordar)){
      horadeacordar.add(Duration(hours: 24));
    }
     print (horadeacordar.difference(now).inSeconds);
     run(horadeacordar.difference(now).inSeconds);
  
  }
}