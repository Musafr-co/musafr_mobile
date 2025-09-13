import 'dart:async';

import 'package:musafr/feature/timer/domain/repository/timer_repository.dart';

/// Alternative implementation using async generator (more Dart-idiomatic)
class TimerRepositoryImpl implements TimerRepository {
  StreamController<int>? _streamController;
  Timer? _timer;

  @override
  void startTimer(int durationSeconds) {
    stopTimer();
    _streamController = StreamController<int>.broadcast();

    int currentValue = durationSeconds;
    _streamController!.add(currentValue);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      currentValue--;
      if (!_streamController!.isClosed) {
        _streamController!.add(currentValue);
      }

      if (currentValue <= 0) {
        timer.cancel();
        _timer = null;
      }
    });
  }

  @override
  Stream<int> getCurrentTimer() {
    return _streamController?.stream ?? Stream.empty();
  }

  @override
  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    if (_streamController != null && !_streamController!.isClosed) {
      _streamController!.add(0);
    }
  }

  void dispose() {
    _timer?.cancel();
    _streamController?.close();
  }
}