import 'dart:async';

const kDebouncerTime = 500;

class Debouncer {
  final int miliseconds;
  Debouncer({this.miliseconds = kDebouncerTime});
  Timer? _timer;
  void run(Function func) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: miliseconds), () {
      func();
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}

extension DebounceFunction on void Function() {
  void debounce(int miliseconds) {
    Debouncer(miliseconds: miliseconds).run(call);
  }
}
