

import 'package:bloc/bloc.dart';
import 'package:musafr/feature/home/framework/main/viewModel/main_screen_state.dart';

class LandingScreenCubit extends Cubit<LandingScreenState>{
  LandingScreenCubit():super(LandingScreenState(currentSelectedTab: 0));

  void updateCurrentSelectedTab(int index){
    emit(state.copyWith(currentSelectedTab: index));
  }

}