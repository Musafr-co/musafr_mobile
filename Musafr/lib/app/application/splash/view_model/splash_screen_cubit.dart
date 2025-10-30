import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/app/application/splash/view_model/splash_screen_state.dart';
import 'package:musafr/feature/user/domain/use_case/get_current_user_use_case.dart';

import '../../../../core/domain/model/domain_response.dart';

class SplashCubit extends Cubit<SplashState> {
  final GetCurrentUserUseCase getCurrentUserUseCase;


  SplashCubit(this.getCurrentUserUseCase) : super(const SplashState()) {
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    final response = await getCurrentUserUseCase.invoke();
    switch (response) {
      case DomainSuccess():
        {
          emit(state.copyWith(shouldMoveToHome: true));
        }
      case DomainFailure(:final error):{
        emit(state.copyWith(shouldShowSignIn: true));
        startAnimation(state.height);
        }
    }
  }

  void startAnimation(double screenHeight) async {
    // Wait 1 second, then animate icon position
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(topPosition: -screenHeight / 2 + 70));

    // Wait 2 more seconds, then fade in content
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(opacity: 1));
  }

  void triggerSignInSheet() {
    emit(state.copyWith(shouldShowSignIn: true));
  }

  void resetSignInTrigger() {
    emit(state.copyWith(shouldShowSignIn: false));
  }

  void resetMoveToHome() {
    emit(state.copyWith(shouldMoveToHome: false));
  }

  void setHeight(double height) {
    emit(state.copyWith(height: height));
  }
}
