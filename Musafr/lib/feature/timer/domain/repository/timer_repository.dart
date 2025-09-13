abstract class TimerRepository{
  void startTimer(int seconds);
  void stopTimer();
  Stream<int> getCurrentTimer();
}