import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  static const maxDuration = Duration(minutes: 5);
  Duration _duration = Duration.zero;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel(); // Cancel any existing timers
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        final newDuration = _duration + const Duration(milliseconds: 100);
        if (newDuration >= maxDuration) {
          _duration = maxDuration;
          timer.cancel();
        } else {
          _duration = newDuration;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Image.asset('assets/images/timer_back.png'),
        Positioned(
          left: 0,
          child: Image.asset(
            'assets/images/timer.png',
            fit: BoxFit.contain,
            height: size.height * 0.15,
          ),
        ),
        Positioned(
          left: size.width * 0.08,
          top: 0,
          bottom: 0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: size.height * 0.1,
              width: size.width *
                  0.25 *
                  (_duration.inSeconds / maxDuration.inSeconds),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.orange,
                  ],
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }
}
