import '../repository/timer_repository.dart';

class GetTimerTimeUseCase{
  final TimerRepository timerRepository;
  GetTimerTimeUseCase(this.timerRepository);

  Stream<int> execute(){
    return timerRepository.getCurrentTimer();
  }

}