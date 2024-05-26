import 'dart:ui';

/// принимается время [throttleGapInMillis] в течении которого
/// функция вызывается не более одного раза
class Throttler {
  Throttler({
    this.throttleGapInMillis = 500,
  });

  final int throttleGapInMillis;

  int? lastActionTime;

  void run(VoidCallback action) {
    final timeNow = DateTime.now().millisecondsSinceEpoch;
    if (lastActionTime == null) {
      action();
      lastActionTime = timeNow;
    } else if (timeNow - (lastActionTime ?? 0) > throttleGapInMillis) {
      action();
      lastActionTime = timeNow;
    }
  }
}
