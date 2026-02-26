import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'enum/enum.dart';

class PomodoroWidget extends StatelessWidget {
  const PomodoroWidget({super.key});

  String formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return "$m:${s.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TimerController());

    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 4),
            )
    ],
        ),

        child: Column(
          children: [
           
            Text(
  controller.isPaused.value
      ? "تم إيقاف المؤقت مؤقتًا"
      : controller.phase.value == PomodoroPhase.nothing
          ? "اضغط ابدأ للبدء"
          : controller.phase.value == PomodoroPhase.work
              ? "جلسة عمل!     وقت التركيز"
              : controller.phase.value == PomodoroPhase.shortBreak
                  ? "استراحة قصيرة       استمتع بوقتك"
                  : "استراحة طويلة....خذ بعض الراحة",
  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),


            const SizedBox(height: 10),

           
            Text(
              controller.phase.value == PomodoroPhase.nothing
                  ? "--:--"
                  : formatTime(controller.secondsLeft.value),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

             SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: controller.start,
                  child: const Text("Start"),
                ),
                 SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: controller.pause,
                  child:  Text("Pause"),
                ),
                 SizedBox(width: 12),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: controller.reset,
                  child:  Text("Reset"),
                ),
              ],
            ),

            const SizedBox(height: 10),

            
            Text(
              "الحلقات المكتملة: ${controller.completedCycles.value}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    });
  }
}
