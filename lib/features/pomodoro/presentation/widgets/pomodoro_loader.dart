import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
          Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: RawMaterialButton(
              onPressed: () async {
                /* bool stop = await onStopTap();
            if (stop) {
              pomodoro.stop();
            } */
              },
              elevation: 2.0,
              fillColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Immerse",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const Icon(
                      false ? Icons.stop : Icons.play_arrow,
                      size: 35.0,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
