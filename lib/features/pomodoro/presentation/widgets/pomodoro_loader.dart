import 'package:flutter/material.dart';
import 'package:immersetodo/utils/utils.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../config/images.dart';
import '../../../sounds/presentation/widgets/sounds_list_view.dart';

class PomodoroLoader extends StatelessWidget {
  final Function onLabelTap;
  final Function onTimerTap;
  final Function onStopTap;
  const PomodoroLoader({
    required this.onTimerTap,
    required this.onLabelTap,
    required this.onStopTap,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  child: CircularPercentIndicator(
                    radius: 120.0,
                    animation: false,
                    animationDuration: 1200,
                    lineWidth: 6.0,
                    percent: 0.75,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              "25:00",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 45.0,
                              ),
                            ),
                          ),
                        ),
                        /* GestureDetector(
                        onTap: onLabelTap,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.brightness_1,
                                size: 8.0,
                                color: pomodoro.pomodoroLabel.color,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "${pomodoro.pomodoroLabel.title}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), */
                      ],
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.black12,
                    progressColor: Colors.black,
                  ),
                ),
                const SizedBox(height: 50.0),
                RawMaterialButton(
                  onPressed: () async {
                    /* bool stop = await onStopTap();
                if (stop) {
                  pomodoro.stop();
                } */
                  },
                  elevation: 0.0,
                  fillColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Immerse",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const Icon(
                        false ? Icons.stop : Icons.play_arrow,
                        size: 30.0,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showModal(
                context,
                title: "Sounds",
                child: const SoundsListView(),
              );
            },
            child: Container(
              width: 160,
              height: 110,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(children: [
                Image.asset(Images.soundWaves, width: 80, height: 60),
                Text("Immersive Sounds",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 14)),
              ]),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
