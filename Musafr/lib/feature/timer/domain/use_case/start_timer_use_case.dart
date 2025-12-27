import '../repository/timer_repository.dart';

class StartTimerUseCase{
  final TimerRepository timerRepository;
  StartTimerUseCase(this.timerRepository);

  void execute(int seconds){
    return timerRepository.startTimer(seconds);
  }

}