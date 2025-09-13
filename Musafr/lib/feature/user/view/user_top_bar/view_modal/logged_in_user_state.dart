import '../../../../../core/view/ui_state/ui_state.dart';
import '../../../domain/modal/user_modal.dart';

class LoggedInUserState {
  UiState<UserModal?> currentUser;

  LoggedInUserState({this.currentUser = const UiLoading(data: null)});

  LoggedInUserState copyWith({UiState<UserModal?>? currentUser}) {
    return LoggedInUserState(currentUser: currentUser ?? this.currentUser);
  }
}
