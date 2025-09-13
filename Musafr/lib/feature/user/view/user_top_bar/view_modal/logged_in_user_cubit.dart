import 'package:bloc/bloc.dart';
import 'package:musafr/feature/user/domain/use_case/get_current_user_use_case.dart';
import 'package:musafr/feature/user/view/user_top_bar/view_modal/logged_in_user_state.dart';

import '../../../../../core/view/ui_state/ui_state.dart';

class LoggedInUserCubit extends Cubit<LoggedInUserState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  LoggedInUserCubit(this._getCurrentUserUseCase) : super(LoggedInUserState());

  void getUserInformation() async {
    emit(state.copyWith(currentUser: UiLoading(data: state.currentUser.data)));
    await _getCurrentUserUseCase.invoke();
    emit(state.copyWith(currentUser: UiSuccess(data: state.currentUser.data)));
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}
