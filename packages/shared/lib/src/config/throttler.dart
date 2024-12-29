import "dart:async";
import "package:flutter/widgets.dart" show VoidCallback;

const Duration kDefaultThrottleDuration = Duration(milliseconds: 300);

class Throttler {
  final Duration? milliseconds;
  Throttler({this.milliseconds = kDefaultThrottleDuration});
  Timer? timer;
  void run(VoidCallback action) {
    if (timer?.isActive ?? false) return;
    timer?.cancel();
    action();
    timer = Timer(milliseconds ?? kDefaultThrottleDuration, () {});
  }

  void dispose() {
    timer?.cancel();
  }
}

extension ThrottleFunction on void Function() {
  void throttle({Duration milliseconds = kDefaultThrottleDuration}) {
    Throttler(milliseconds: milliseconds).run(call);
  }
}
