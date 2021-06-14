import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text_basic.dart';
import 'package:stopwatch_flutter/ui/reset_button.dart';
import 'package:stopwatch_flutter/ui/start_stop_button.dart';
import 'package:stopwatch_flutter/ui/stopwatch_renderer.dart';

import 'elapsed_time_text.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  // late DateTime _initialTime;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;

  Duration get _elapsed => _previouslyElapsed + _currentlyElapsed;

  bool _isRunning = false;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    // _initialTime = DateTime.now();
    //_timer = Timer.periodic(Duration(microseconds: 50), (_) {
    _ticker = this.createTicker((elapsed) {
      // final now = DateTime.now();
      setState(() {
        _currentlyElapsed = elapsed; //now.difference(_initialTime);
      });
    });
    //_ticker.start();
  }

  @override
  void dispose() {
    // _timer.cancel();
    _ticker.dispose();
    super.dispose();
  }

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previouslyElapsed += _currentlyElapsed;
        _currentlyElapsed = Duration.zero;
      }
    });
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isRunning = false;
      _previouslyElapsed = Duration.zero;
      _currentlyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return ElapsedTimeTextBasic(
    //   elapsed: _elapsed,
    // );
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopwatchRenderer(
              elapsed: _elapsed,
              radius: radius,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                  onPressed: _reset,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  onPressed: _toggleRunning,
                  isRunning: _isRunning,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
