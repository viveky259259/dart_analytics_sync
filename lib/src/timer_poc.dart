import 'dart:async';

void main() async {
  print('started');
  startTimer();
}

void startTimer() {
  late Timer timer;
  late Function function;
  function = () {
    print(' ${timer.hashCode}');
    print(timer.tick);
    if (timer.tick > 2) {
      timer.cancel();
      timer = getTimer(((a) => function()));
    }
  };
  timer = getTimer(((a) => function()));

}

Timer getTimer(Function(Timer) callback) {
  return Timer.periodic(Duration(seconds: 1), (timer) {
    callback(timer);
  });
}
