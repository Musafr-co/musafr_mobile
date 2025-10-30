import 'package:bloc/bloc.dart';
import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/user/domain/use_case/get_current_user_use_case.dart';
import 'package:musafr/feature/user/view/user_top_bar/view_modal/logged_in_user_state.dart';

import '../../../../../core/view/ui_state/ui_state.dart';
import '../../../domain/modal/user_modal.dart';

class LoggedInUserCubit extends Cubit<LoggedInUserState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  LoggedInUserCubit(this._getCurrentUserUseCase) : super(LoggedInUserState());

  void getUserInformation() async {
    emit(state.copyWith(currentUser: UiLoading(data: state.currentUser.data)));
    final user = await _getCurrentUserUseCase.invoke();
    if (user is DomainSuccess) {
      emit(
        state.copyWith(
          currentUser: UiSuccess(
            data: (user as DomainSuccess<UserModal?>).data,
          ),
        ),
      );
    }
    else{
      final response =  user as DomainFailure;
      emit(
        state.copyWith(
          currentUser: UiError(
            message: response.error,
            data: response.data
          ),
        ),
      );
    }

  }
}
