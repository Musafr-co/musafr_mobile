import '../repository/timer_repository.dart';

class StopTimerUseCase{
  final TimerRepository timerRepository;
  StopTimerUseCase(this.timerRepository);

  void execute(){
    return timerRepository.stopTimer();
  }

}