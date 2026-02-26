import 'dart:async';
import 'package:get/get.dart';

import 'enum/enum.dart';


class TimerController extends GetxController {
  //TODO EDITING THE TIME TO MINUTES
  static const int workSeconds = 25*60;
  static const int shortBreakSeconds = 5*60;
  static const int longBreakSeconds = 30*60;

  var phase = PomodoroPhase.nothing.obs;
  var secondsLeft = 0.obs;
  var completedCycles = 0.obs;
  var isRunning = false.obs;
  var isPaused = false.obs;


  Timer? _timer;

  void start() {
    if (isRunning.value) return;
    isPaused.value = false; 

    if (phase.value == PomodoroPhase.nothing) {
      phase.value = PomodoroPhase.work;
      secondsLeft.value = workSeconds;
    }
    isRunning.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft.value > 0) {
        secondsLeft.value--;
      } else {
        _timer?.cancel();
        isRunning.value = false;
        _handleSessionEnd();
      }
    });
  }



  void pause() {
    _timer?.cancel();
    isRunning.value = false;
    isPaused.value = true; 
  }

  void reset() {
    _timer?.cancel();
    isRunning.value = false;
    isPaused.value = false; 

    phase.value = PomodoroPhase.nothing;
    secondsLeft.value = 0;
    completedCycles.value = 0;
  }

  void _handleSessionEnd() {
    if (phase.value == PomodoroPhase.work) {
      completedCycles.value++;

      if (completedCycles.value % 4 == 0) {
        phase.value = PomodoroPhase.longBreak;
        secondsLeft.value = longBreakSeconds;
      } else {
        phase.value = PomodoroPhase.shortBreak;
        secondsLeft.value = shortBreakSeconds;
      }
    } else {
      phase.value = PomodoroPhase.work;
      secondsLeft.value = workSeconds;
    }

    
    start();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
