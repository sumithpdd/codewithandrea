import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text_basic.dart';
import 'package:stopwatch_flutter/ui/stopwatch_renderer.dart';

import 'elapsed_time_text.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  // late DateTime _initialTime;
  Duration _elapsed = Duration.zero;
  late final Ticker _ticker;
  @override
  void initState() {
    super.initState();
    // _initialTime = DateTime.now();
    //_timer = Timer.periodic(Duration(microseconds: 50), (_) {
    _ticker = this.createTicker((elapsed) {
      // final now = DateTime.now();
      setState(() {
        _elapsed = elapsed; //now.difference(_initialTime);
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    // _timer.cancel();
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return ElapsedTimeTextBasic(
    //   elapsed: _elapsed,
    // );
    return StopwatchRenderer(elapsed: _elapsed);
  }
}
