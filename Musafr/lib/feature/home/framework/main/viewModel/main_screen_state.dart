

class LandingScreenState{
  int currentSelectedTab;
  LandingScreenState({required this.currentSelectedTab});

  LandingScreenState copyWith({int? currentSelectedTab}){
    return LandingScreenState(currentSelectedTab: currentSelectedTab ?? this.currentSelectedTab);
  }
}